Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4B3D784A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhG0OPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 10:15:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42918 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232136AbhG0OPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 10:15:23 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RECIPI023444;
        Tue, 27 Jul 2021 14:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Ie/nr4+GoWy9PI3ltbgQ5GfgaF5KEhNOphtZNWP6ViI=;
 b=S19AnXpmYMB2swXRaMeNWvCoK7hf3uaTKrvhtfyDZPdDR2vELhW34tTVK/vp9GGbrN2Q
 PRfMrGy75IwuocgKIueRhIffrOT6nMVlMBY9Beg7huMKtqJVqkX14idxw0+9Gbm8S5eo
 Akp/1JvRBVwu7O+tnFjRar1kEIG322Ko/Su/NVS2wt4feVMN+TZDBFSB7IaECgh14vl+
 gduoJBdWljpAXySws4niP9fCJnM7ubzf3aVSBTYBTee5x2Wm9LPVsSksgN0IZdb9zdDF
 5soYscw8axfGwKdRBKjQavx66dfuG2034o8RiaAw1LZVkXdT2VLg4Ytfa0bOntSWCZzm sw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Ie/nr4+GoWy9PI3ltbgQ5GfgaF5KEhNOphtZNWP6ViI=;
 b=o0/ftFJ4VyN0fNi3bEwYeToysmjwCLuK1aQ+sOdklTnbGvg9yow8U9bnieS7DGRLp9wA
 Mjyql8KTOL72GBTiWY/AegliA79sa8jYQdzQq/qaaDibs1mTs79vbGRiJKghxLmPFGok
 ufGyhoWq6soSAaRVek9Gv9yL+ez8wK3ZnP8AjELCtcsYUF9iFzkFg7Fgo5AiPfJ43PTT
 8IDZPGdGaK1H+E0aBaxzUd5VVx8JzqOYCIvFsdo62mSI/TmjhEPDKjouALRJpraEb7yk
 7dlx/yyRA854nIVoAedhvBJGvsHW+b/w2KRnWC5PSWbz8KeOAZTKiYEdJottmaSlFIEl 3w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a23589wv5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 14:15:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16REBg7d112260;
        Tue, 27 Jul 2021 14:15:14 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
        by aserp3030.oracle.com with ESMTP id 3a234ag7s0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 14:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW/INpsVFz8ECpRZpm7jZikH8ylRKAaEeosb9/hr2adb3LSK/tvjl4/GdKVsm4xRQDcLC+XWLEiwA87yOwDCmIsATo4U6RqAvW3YdxovHBw/IOnrHZBWqnNqWSq8Ge82POmzK+D505DIoWos7sAI37mv0/Mqf8IGrKQMwwMucvRjsp2ly8M53BmGw4fqDYcq8BicLXJfo2brwO7iyuDKk86NnrcKbUofwySMaxQQ8gpQ12jdVnnhgiiBIMeWE+5lzJj0hcaX5ALxRW2aVu+Pw5cJnkn5Sovjl04CoX1R2atxObCH696Apd6T22xmM16wbKMSLpJWcjUyvNYp0Uwx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie/nr4+GoWy9PI3ltbgQ5GfgaF5KEhNOphtZNWP6ViI=;
 b=UZHtFKW+fkboaFUPbqSWC5RR+jlOabuNdsuRH0H7e2MrcUn9styGMLsrpHAsvyi9wM/4dup35MdHnK2wmF6VxwOjanMdkS7cqHszCyGlfqGYac1FfrmIg6VsZKvpsTs+bNSLpG9GYVmXfqQT8KZNCWdsZBUixh9Xh+CPdDXwDXQ9qXym2YsNA42YFTd4adXsyLfEgy3kPaKdAX+zIok6PxZ6moHJkh4zkZl0PKzVpw/EESDBgq+2LmEc0Fp50BwAbkYnfDtKCbiSMIV0yVI9K8twGA2uaoklo/YpuykgwhzQCbimUQKhm6bPtEb/sOBlKwFHpjtYpDk2Znr8wwF9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie/nr4+GoWy9PI3ltbgQ5GfgaF5KEhNOphtZNWP6ViI=;
 b=ANHcetCaZJJmvWIEaobLehCdbskuYpgvJe5VkavRPorvm61J30cv4lIj3O+nLF73IImpwpmaXHaVJGoNkRG2lziGBEU6ypilhEkW4kQIoHHEXADxPYH+WPuwdD0SOdIqenUuUm6mXvbiYZ7rdRpnc70M4QxbRLrG37tqIsf1h3g=
Authentication-Results: sina.com; dkim=none (message not signed)
 header.d=none;sina.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1821.namprd10.prod.outlook.com
 (2603:10b6:300:107::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 14:15:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 14:15:12 +0000
Date:   Tue, 27 Jul 2021 17:14:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com>,
        igormtorrente@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in em28xx_close_extension
Message-ID: <20210727141455.GM1931@kadam>
References: <000000000000d068cf05c716264c@google.com>
 <20210727100151.2051-1-hdanton@sina.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727100151.2051-1-hdanton@sina.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 14:15:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bfaae0a-9e07-4082-6a9e-08d95108f2de
X-MS-TrafficTypeDiagnostic: MWHPR10MB1821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB18217017EB6E2AD983B62BB18EE99@MWHPR10MB1821.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1y/bRyq2qZpR+sVuDTgKmfZNW74ws1dSDz9/HDGtddX1QJEAZof6NdAYAjL08gOqgpcO8KudHZLe/3h2Tt+Q7qm5dKAbLg8iobzMaFK1tObmhkeWLbelGzBVS3Fyz7/LKrESzkX83DGYXSEQGfXdjeDtswG4xCOI6H2ERZ2KlDPPDbypgBcb761fZ/e/ZJ1AT33NuvqeFCvl5zsOg9G5FBNe5oUKcKJzvCtwbh2dGgRt4suMfV4jt8nZYeNFd9fbszBgbBysHTLAA+TAhjg/t8imr3ANBtm6eRulGkzuyr2yhU6kZKHVFE8NRW/ROERP40/0BQAJqVwHKmFu0f2KoG2nUtRT2wqy1MS+FY3yWW5Ofcr4hqrvdX+guLgS9QBhp+kjBExjF3loh34WOPTkgG3whwGDIFxa+ZDu03BVL8Pmkh1t+VZFdJFyiw9cpcC6iMrCXqZbavVS0W4Ulqgtyz91ql5/71fUWz5+IeYHzCiCuRrsogd8uZjwuvzNk3C32H6/BvLq8KiZxzX6ACXfsSRqXke4seZYX97aXGiExe5tPk+/9UrnB1E62kZOuQavEliiVdoR6pSmV6dJx0/sU77SGSmrU+q/IK2P0BtWMOPDiWPMl1sqgJQIJz7tEpLqjFNaQLWkfzMwu8EFFuOrIqhC8Cpjy8/zvme3opLHILNgPLrfOZPy5WKF0be0m8DTgJV8XBRAvrFWNgJ5j/2Sjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39860400002)(376002)(136003)(2906002)(86362001)(9686003)(1076003)(55016002)(4326008)(8936002)(8676002)(478600001)(5660300002)(52116002)(6496006)(26005)(956004)(6666004)(33716001)(66946007)(38100700002)(33656002)(38350700002)(316002)(6916009)(83380400001)(186003)(66556008)(66476007)(44832011)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5aktA1pQfY64NGboZ+GJD1uWbokBPr1S78oxBPase5Oof2BZvbyubaHA1xg?=
 =?us-ascii?Q?Q1+iABYqbWPLMpa1vxbugv/+9SKYNu/nQmPQsnyZa7hcGeNoQ5XCNRR+kGJG?=
 =?us-ascii?Q?uk7sTEqoUYKbx7HItsEEHdlUOEy+O9SOyCt56BLLc0IK5p0d3iK9f78qZVtW?=
 =?us-ascii?Q?L6C6Aht1XRFoQwwDLh75HjjWFRo1W4gp0GAYYE828+4I1CFpYEh5O2FQ3Tl2?=
 =?us-ascii?Q?nxhGONKnAI66LiNU0LZFK1B5H844IKxzvXRCuJPagAUCbEhYMWTcgA97X4vj?=
 =?us-ascii?Q?kgpMMpyaqqUiwd8m+TaxXey99vZljUrBNwbSr0FqflJDMSnTfdNrTJhWvQvA?=
 =?us-ascii?Q?rqT10tzefsAyZMhFLjbgglsGe1Yvb352yvDyHBWgiMIqsbxYewEFWo0mxPS8?=
 =?us-ascii?Q?1eKS7zboaiG5ruie1aQbWwak+RIynFwPS2LOe48ejUgMYK7MSQE/xt/pQ+3/?=
 =?us-ascii?Q?4Yj/1WypY+Qcc2DawyscLGpY3KNR1aTP3f5sMtTTvI3+yd5PaKpBjRqXGTd3?=
 =?us-ascii?Q?6TR8KbuhVqs2mbjq2FBR2LnKHXVNotj3ugqcv0EDO6VyHHfS+r+LPiYi+gvE?=
 =?us-ascii?Q?/Mdamq9WI0PlofA6+WriPls1rp9suCWiaFyOWSKPABIwQ4V96ECowoEGtfcA?=
 =?us-ascii?Q?u4YorDgIDw8VKlH95NuaNYC83NZ2xF2blurt8UuhEXhHgOukQKBkeVKA/kFL?=
 =?us-ascii?Q?+/f8TcU/Pq2J49OanW5rw0d654l54LzsU9uZF+c5x3WdtawZRCJilT1ruMRd?=
 =?us-ascii?Q?pc3ihE3qhpQsz7shed6cnOKQh5ZCC7T3C07L35WZjervN1IzZfdUAOmDzEgw?=
 =?us-ascii?Q?C7zNzgamrtMX4Glzw9VskMpFv1AtHENKtqdtv6VL3VxwCOiovMegXPx4yTvh?=
 =?us-ascii?Q?PeLvnYmXMJUNEZ3i45DDsUA9wFw+brfyitLqbReWdb0QmOGhCJOEPjMQ6ZRg?=
 =?us-ascii?Q?4or3DIqKyD51dJc37GVlL2CAhJavB/UVzV+VOy8AkoT1Y9zELDB+EhP57QX9?=
 =?us-ascii?Q?Hejj8uaaALNpKqEl44FC+RUj/l0sTOWmW+hqwUNONtU74rn+nmyFACm4nT8x?=
 =?us-ascii?Q?AOjPOonb8j+RJe5VFKVLTx41eSFyrbJ/MfeRYn19VDgPeYIQMiym+BknWrGX?=
 =?us-ascii?Q?cQwFoR5yz/fH3Js3FYRLmX47RTEQVsgwqNUDIB+10aoxV+cQSa5GBRw7r6Ny?=
 =?us-ascii?Q?rIoOaJEohctJ3q0Z3L5NTE6WPT7EcSb9UEAun+ShUyZGOKz1jYpcXrw5VcXD?=
 =?us-ascii?Q?8sdbxlEYSHsEQtEN60cSdqkv1PvKOj5T6O9Qal+AlGVKvwdQK05998JrnYWh?=
 =?us-ascii?Q?axSKklpuv4KrSKLxPyPEjcz3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfaae0a-9e07-4082-6a9e-08d95108f2de
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 14:15:12.8185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An0j5FrSUfSKVs5EYLEOaMZXCovejS2igP+zg4BTNKSXKDrepV4voaKmx57CIS4RkAL4/yrFbUFCOeKOmHHljyE50yUooevbEnjxwC2w0l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1821
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270085
X-Proofpoint-GUID: dM8XJhSpNi3iX5cDF6Dd0P8G_eC3kIaz
X-Proofpoint-ORIG-GUID: dM8XJhSpNi3iX5cDF6Dd0P8G_eC3kIaz
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 06:01:51PM +0800, Hillf Danton wrote:
> Along the probe path,
> 
> em28xx_usb_probe
>   dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>   retval = em28xx_init_dev(dev, udev, intf, nr);
>     em28xx_init_extension(dev);
>       em28xx_ir_init(struct em28xx *dev)
>         kref_get(&dev->ref);
> 
>   kref_init(&dev->ref);

Good detective work.

I've created a Smatch check to try find these.  It uses the fact that
Smatch creates a bunch of fake assignments to set all the struct members
of "dev" to zero.  Then it uses the modification hook to find the
kref_init().  Those are sort of new uses for those hooks so that's quite
fun.

I'll test it out overnight and see how it works.

drivers/media/usb/em28xx/em28xx-cards.c:4086 em28xx_usb_probe() warn: kref has already been modifed (see line 3979)

regards,
dan carpenter

#include "smatch.h"
#include "smatch_slist.h"
#include "smatch_extra.h"

static int my_id;

STATE(fresh);

static int get_line(struct sm_state *sm)
{
	struct sm_state *tmp;
	int line = 0;

	FOR_EACH_PTR(sm->possible, tmp) {
		if (tmp->state == &undefined &&
		    tmp->line > line)
			line = tmp->line;
	} END_FOR_EACH_PTR(tmp);

	if (!line)
		return sm->line;
	return line;
}

static void match_modify(struct sm_state *sm, struct expression *mod_expr)
{
	if (sm->state != &fresh &&
	    mod_expr &&
	    mod_expr->type == EXPR_CALL &&
	    sym_name_is("kref_init", mod_expr->fn))
		sm_warning("kref has already been modifed (see line %d)", get_line(sm));

	set_state(my_id, sm->name, sm->sym, &undefined);
}

static bool is_alloc(struct expression *expr)
{
	static struct expression *ignore, *alloc_expr;
	struct expression *right;

	if (!expr || expr->type != EXPR_ASSIGNMENT || expr->op != '=')
		return false;
	if (expr == ignore)
		return false;
	if (expr == alloc_expr)
		return true;
	right = strip_expr(expr->right);
	if (right->type == EXPR_CALL &&
	    (sym_name_is("kzalloc", right->fn) ||
	     sym_name_is("kmalloc", right->fn))) {
		alloc_expr = expr;
		return true;
	}
	ignore = expr;
	return false;
}

static void match_assign(struct expression *expr)
{
	char *name;

	if (!is_alloc(get_faked_expression()))
		return;
	name = expr_to_str(expr->left);
	if (name && strstr(name, "refcount.refs.counter"))
		set_state_expr(my_id, expr->left, &fresh);
	free_string(name);
}

void check_kref_init_too_late(int id)
{
	my_id = id;

	add_hook(&match_assign, ASSIGNMENT_HOOK_AFTER);
	add_modification_hook(my_id, &match_modify);
}
