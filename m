Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895933D5894
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 13:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhGZK5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 06:57:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3470 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233113AbhGZK53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 06:57:29 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16QBb2Vx009447;
        Mon, 26 Jul 2021 11:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Z6EX0Q843SZk+/IynQWbn5jOFA9enAjZhjvUPE6tdjk=;
 b=baJk56wDuaYlPdOFtkKvn6GMaAcVV88lwL3tEnh5BTua0/s8aLuaEASD/6KXD0r8/lxR
 7V24zP3ttPgXGvtOB3VIxB9LBnezD+pWyA9x3fVoFjrzjbhQn2e/zlUkgJmb/wplTBcJ
 jy1Okz2P2zcWJdUfIL5HLcYKqz8sHlYTv/gTVn0DZyFKDswp1dCrpYFbzYk/mLQeIFOM
 M1mvBPNtYIy9ngfgRz40GqVVPwgX0X97InYGkgpWNYkLriCnYVTZzmin3GHk8w0rcx71
 Zo97M8L4J4VszJxc3vhwIfQ+fxLclqSvgiJ8OP7itqxYZapWiPcQOM+2kZoTzIxn+iN9 UA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Z6EX0Q843SZk+/IynQWbn5jOFA9enAjZhjvUPE6tdjk=;
 b=LGvhxXIFISY6EdiVqizB5nfkTJRAFG0Uk+GkItAN6pQqwBM9nOE8mzFRmyoHoMjInTfz
 rwBEpztKj4sx0nHPmgDdJhJ/f6RjHomcCUqDM900EF4z16rwb1poPqZL2hbesj2yG9Bn
 ph4x5j9Jo8D1qjoBPMZdr03+UH53U9FfRGwgpHgdcohHG2yuVxHZvmv5UY7gu1v22lXJ
 1MJt1foiNzk5VIBKlTxtbocfCgbZ53Kj+Nuvo4gNg07AABKVd+mWas3IufdQ/2rVcMiX
 tZyBtQDIMa7287Gp+hUUSvdOKWQDSC3/EmtiJnmJ+3Oby40k+3FWNMY3gxPo/jxvYVxg dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a1up6r2u8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 11:37:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QBYirA133780;
        Mon, 26 Jul 2021 11:37:40 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
        by userp3020.oracle.com with ESMTP id 3a0vmstr3t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 11:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDi+7ZTsoOOWKK5/JjM6L1SylSYuF23csOlJZK5VklQb45tNNLw/tZSwDGQfkQwx+QsQng4Zbw8theYorB82wKtFHMoEWEvaOv5oXOB1mh9ehzSHmNot550RrgRrglNHCCWWBXZYNRuyP+oWkpgbJDxdissj3iRg7qpGxGl4NWp0BQp8YuX0iv2EG3AAV3pDJOLHRxeVgAGDWv4mceUu+SWV0SYUKB2ApLjyoPRarShJFkqNubxHO0t48itAhHHqtjaigAFaZATzl/orpqpXXTd26EOyEjCiUOxo9gv170CV3s63axupksg6pa2Acle+TE+3vNrH1dY0AlQ9rPWoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6EX0Q843SZk+/IynQWbn5jOFA9enAjZhjvUPE6tdjk=;
 b=A3FaaJoASO90IRQRZud9Et12qV/iZYYVebzWc8Nn4nFpiZLBs4lMTElYjVnQd6w976KbAylUC2/364J8McSGK16nQmxS5ZO8hrcEgqtg5QVSXRdMpFIhzHkZh2HajGsp/9VdVyKHiIi+lSEltknKIwZYaUurgZO2GJ4o8r2DNt5i6QmjMX8c0KgZ/PypJayqJ5/G4GCmJSAa9WUMYqrieEY0zpknp6iBRUyxlHDlvu7eWxncjN2qT/QBTWAWetdZQRsSZ11tlCmA+As7Yw3fLz+i/QXNWUbwpZ2XpLcRbqqM66VS70OxCtZppuXCyNwZ+ypmCeQK1ChylU+Jtknzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6EX0Q843SZk+/IynQWbn5jOFA9enAjZhjvUPE6tdjk=;
 b=VPKfTpWcTrtz2kS7DFgzZp9SCQLSAJwbkVjsa3ZFtawRUT+MRBo/7WHmgZPw+s4ICJkGPAJa2qDD6mUF/GfWnbKMUs7dQJ8Bsfx0Vx8JCWKKrBVRR0MyQ9PAxuO4bdy/1OG3Jd9vZnK0M8NuRbRCPj5GrF78UBXJOMQzDnlIyY0=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1423.namprd10.prod.outlook.com
 (2603:10b6:300:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 11:37:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 11:37:37 +0000
Date:   Mon, 26 Jul 2021 14:37:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>, shawnguo@kernel.org,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        slongerbeam@gmail.com
Subject: Re: [PATCH v8 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <20210726113711.GI1931@kadam>
References: <20210723101217.1954805-1-martin.kepplinger@puri.sm>
 <20210723101217.1954805-3-martin.kepplinger@puri.sm>
 <YPtNQG8/+O+OfoU6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPtNQG8/+O+OfoU6@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JN2P275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Mon, 26 Jul 2021 11:37:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a69e85f-c936-4df2-acb1-08d95029c49b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB142336DFFF33EFD8E5C0704D8EE89@MWHPR10MB1423.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7ETwcu2N8iFti1+2VoMozfuIus/2qLffFsjXwh0DFTK+pbVLnhwbxs0GlyvWQaw/bXn0EHxsYLDyephRqLxgcSBqq799h169179Aa7YcSVUs4RUw7YnBqMmge8tVJWlDZnfkTcjGAniDpdncYCeAUauGFKYlCOaNPdftZOUHDjSod9Tj2l0kN3seYhs1s5ab1qwazmpV89FqSSPoVv1ngVeg97Wdg2KPchSnau9uva+u/Q6sQRbVOi5y1/zxgTkarNuvjg+nacvRSH4JD1Lu4xx7Ak5JEkWmzxNFa4THTTqsimHTSALZSSra6ueWezy1S77FPTWyTFiPAXMYDnlMSEiWGgInSjKtRB8CrotOAf5RvMP9MBK7KP4g1Cxy3g/7fLxl36lji2A1qjeWBJAmgMozWNlI8SfvzsR2F1Dhi1dGFFS4dNocxBg2fUrqcp9mmXwwINSeLnxVn6+3YkOwycQ/i/cowV2kdRGgTcK93O4BIhvB/A/XfnneOET2GKoBXvYcE18dELTdg8VngHWX2OPhUZ7ZuCJhtNFWLq/GwHMmXLBSS3RP/VzaHQXDRDQG9vqhixUq+52zce1Gyd65OTVpgchS2VDeojmi3ygKbNXGu5mEzqW/p7YeQpMrSNLUg1Ziy0e4loZB+RVVzRaLCs4pBAmGhN9MJ7uKHDnBDoL/F9LZEoi6IpvHbjg5spfhqzHyB6XVDo7DfzoiycZng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(956004)(9686003)(8676002)(5660300002)(38100700002)(38350700002)(4326008)(33716001)(8936002)(44832011)(55016002)(1076003)(33656002)(86362001)(4744005)(66946007)(9576002)(52116002)(316002)(6496006)(7416002)(26005)(2906002)(478600001)(186003)(6916009)(6666004)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ajWMfFS7VGdI9C01eFr5VL6WAgQB02fYybSx5gLYi4G9VQW2kfk9gKyB5YX?=
 =?us-ascii?Q?IleizU6Ovth+zCM5AJhdskTxx0PwtJG3tbs3QbEiIvfQe80de5e7NWfUMnaw?=
 =?us-ascii?Q?3EPRT5s1ckjSYwaB/O21XGHngWKoOxKWzW+T5lqSH5TuGJkn8AhPKvutIZcz?=
 =?us-ascii?Q?TIOay9z3UDiYwqDsY2ND+fkXeudIUWTh2awao3APDQQotQ/ebJpXr/gUKJLD?=
 =?us-ascii?Q?2v3gov6G3MEISID5M5iVWU5oEs+P6ilBAJ1Kb0T9U3lXEpL/+qQFVvSmNkFW?=
 =?us-ascii?Q?syh9H8/RqK+NSN/aC/Gyv+Ly5k+juqYcVj2ZXKbGGu9iv0anWpcTTN8wpO/K?=
 =?us-ascii?Q?Sf3rJHq9b9AWdg/zNQCfa71Fa3PCEahCYkrI5w0ADujASAbLKcFRKvU981CE?=
 =?us-ascii?Q?wZP0V8OoZpn+N0CjAbXZ5q3NheerFti9hJeeUciaM80mXZIc0X4ddZvfr3P5?=
 =?us-ascii?Q?3IUWPi9K0yuWnTgHqVLxMBvucRaz1Oxv2RO82jZQZY+jJcBePLqpZq/LZ29d?=
 =?us-ascii?Q?aIkNeyVVUUkUueqSNaiRSDuFgsOs9TDRGry0ldfTAFP7I2m2D0X4+LrWf70a?=
 =?us-ascii?Q?DTKcZRr9jSvW/eONDPY2rTsM7Oc435rwhTAcg9Fk9hVD0QdQ6b9Eu1J701bO?=
 =?us-ascii?Q?xP/LftNGyjDYEy5vGL7Bg5gu1/ZnoSG5z44rKgTl6hNCnWarm2CiCKTyaXW9?=
 =?us-ascii?Q?5IW8wgVSehHmAFm4vGQ0VTZtjPkmrUfmwBFgdltcmbiJZaOKU1oPx2adhHKn?=
 =?us-ascii?Q?z73CyqcZ2Ycyw/xOim4fuy4noTmECkLDWKxkjSR0WIdJ10qbWhCMI6uEL0yx?=
 =?us-ascii?Q?zOFws4Iu1YcP2rB1Q+R/LyARhbpsqx2BX8BeaTKaKGckEsZm1bPd8YuVifsP?=
 =?us-ascii?Q?P14Prg2FFrtG1MTk2uFq+58H1F2tkC9dHyj3Fsw+fmy68b9KUXtpb900R9jq?=
 =?us-ascii?Q?nYw1SBQbPnRJLYNgowwevvqHyNOotEjbdcZr5DIcpRzdTPXgPapRrQWhTyyt?=
 =?us-ascii?Q?dRFwbtp+DfC2gBFYNSMvmBcoQDX+V36zns/NCLciwkiGDUaPiGweO/cIeLbC?=
 =?us-ascii?Q?lAYAUXsO2EF6G6Si8czLyBESu0qBa4R/LX+4qmFatd77k9p3iCEALO4SmkIH?=
 =?us-ascii?Q?+0fDI3LslSO5dPNwg/OH5WmFAQpFTKebkA91o0P9ZRL9dPRacb1RQfTY17Is?=
 =?us-ascii?Q?+kAbHcgXZawCBjJdIGzk+vxEpmStImYl575TLEo+ozpWkx3rPbEJLEOSQWP+?=
 =?us-ascii?Q?zsOYJhjdqTpP6nmluIRQ5urq2leKecvoucHaGqi5OEZCtSjrLTU6YArY7+7d?=
 =?us-ascii?Q?+It9WQxGjkXxniMmf3lHV8NI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a69e85f-c936-4df2-acb1-08d95029c49b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 11:37:37.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0p94ZP+G/6t6FdHo22cnxEMY9O49Auc4EWDimbJo7zmdSUgz8qy15DT4r8eIw038kb8qG1+guQOzjWNL2Y1ib68L9FdXnBFf1KzPIFrTolg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1423
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260067
X-Proofpoint-GUID: np7DXw_aY6ibZvlAU9gHh4VzVwyQPf6z
X-Proofpoint-ORIG-GUID: np7DXw_aY6ibZvlAU9gHh4VzVwyQPf6z
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 24, 2021 at 02:14:08AM +0300, Laurent Pinchart wrote:
> > +static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state)
> > +{
> > +	s64 link_freq;
> > +	u32 lane_rate;
> > +	u32 esc_clk_rate = 0;
> 
> This should be an unsigned long.
> 

I have created a Smatch check for this.

regards,
dan carpenter

#include "smatch.h"
#include "smatch_slist.h"

static int my_id;

static void check_type(struct expression *expr, const char *name, struct symbol *sym, void *data)
{
	struct symbol *type = data;
	int bits;

	if (!expr || expr->type != EXPR_ASSIGNMENT)
		return;

	bits = type_bits(get_type(expr->left));
	if (bits >= type_bits(type))
		return;
	sm_msg("wrong type for '%s' (should be '%s')", name, type_to_str(type));
}

void check_clk_get_rate_returns_ul(int id)
{
	my_id = id;

	add_function_param_key_hook("clk_get_rate", &check_type, -1, "$", &ulong_ctype);
}

