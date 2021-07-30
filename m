Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF783DB4B0
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbhG3Hue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 03:50:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63288 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237851AbhG3Hud (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 03:50:33 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16U7fgTn019641;
        Fri, 30 Jul 2021 07:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=/kiHSFOTYyn91SCFA57fQuvL/wkvvlbAcrp9n3babMg=;
 b=uhPDJ5fysVzVFg3uVm7ZG+jhcBlsEKeTA7Y2mkSO8BKUvxHschn99WBjxQmeES+cqyu7
 a3cvrHVxgbg8kycp3yOWnhHa6qncLxZBtBKI8Sa7AvaOlprEI016yQuLxbqzzOAOL+bk
 haCfW43Xy92h928P9nZUdQdk2ZuevVqXGtDKKso9bJUTLB5+HkJojXTlUJFV6nFK5fhW
 fDNsSz/4rZPPNB53mUarK//yOTv1nWfyYe0OAGaL6dO2aI6HtWchJNXmIVklaOepLOpx
 G0Wt475XHaa3E7TmgO1kK9i/O6KhYc2jB6BGBjRbJc+53gRnM8NlTPPvD2Q4a3Z2OxPN hA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2020-01-29;
 bh=/kiHSFOTYyn91SCFA57fQuvL/wkvvlbAcrp9n3babMg=;
 b=owc1aY4DuTCOYqnWEfz/tWWrSx+MSNOd/nRnkUGBVVNpZtUei00Kuczu7SVKEUkDeyUp
 n8fcv5dvtMKbPYotL4GWlwAJDSngpJvVLKUkWDIC5B8Or765e3DpNZlOfg8OkRigUQ30
 zV17iK6v7FZ1CpbtZEX6ISQYg+VTYO9qPMTrWgm5nX17hHA7M36Mn6J3Y+owJguv9P/W
 ZG/754C34R+6WpwDnb9cpl7b8JEVDFm20QUk6OJiAtovoreQiHT+H/g2eF1AqjMZQToB
 /FeiaSUnSmLVCWZjxs/XiREks12VWxmnaFj1oEOytDsYY9eTmgE1NQjlMfzuCarAzCqV IQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a3uuja599-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Jul 2021 07:50:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16U7fOsb174244;
        Fri, 30 Jul 2021 07:50:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by userp3020.oracle.com with ESMTP id 3a2352j214-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Jul 2021 07:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElT2bqqI8XJbTwLqwx4Xz08wp1TTpnnHDzmWX/XoZiVbIWSTyYVN7EgB1J5D4cdG2WJSFPSBfF7rft+rco73VW4iPL51C8o73tTgSXc0F5AACmaKX0XTgG4jvhJJnq3s89qcbh7i8+epHrDSctRMYgy09Ku2edM5WWllWYYVVdVcIIG6j1M5QHtCj3fyUDz5l/FYheoLm6BvbGok9VtimDn1f6iAAF8GhjKW2WSDkttBEMkw78rIh+cO91hUSUGvm05nTAhJN2QZU8swn/aMkW/BTEP/gv+re3dXPvmfyZsBrviUfSKohksqW/8WNkd5HFj97o8GhCMWNqrR84ShAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kiHSFOTYyn91SCFA57fQuvL/wkvvlbAcrp9n3babMg=;
 b=bPaixhDgRFupGHTMQrGO6nkGrC0RFRdpo6gylxLceyBZCNx0FTjvOhM6wqUS4vR1hequZn/vSHjG8DoSomV4vkzgy5W5ZbCFCfh68ifnrnrzi0/CzNeWUrPiXgYWsN4YRe6yU9g3Y7ulnLhDjNLDCh3oPD4KKYPNUr1JrJPzaLM+71dM6A5a3Y5sZI7SsnjourI31vM2ms2PwrCeGiQc8W9BJWmaXhiVad4POGuBw2i54WQN6WOrI3mR7aB/dg9X2yyN7qysck3HFewlJ+pVwq99BPkAXzrlfxPufjFpcKi+L4+blf27SkZ+ilp3/EwFt2XShErKsbhz4vGWCO78pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kiHSFOTYyn91SCFA57fQuvL/wkvvlbAcrp9n3babMg=;
 b=HubzLI3GJ7ROI9H2DOLwKaydum0Mq1J/Nng3YkQ6xs23sTVYLNn/w75HyE3RmRymnuaz1dR8j95LzZjo3zt7v3BEAk0QCqr7Sl7oDZgIIZqcP+Hv8FgMVoCKhudoL3tDOOIejXaZwYwRL3As9IJxFI77jN8fnK7NVUEubl9GtaY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1565.namprd10.prod.outlook.com
 (2603:10b6:300:24::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 07:50:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.035; Fri, 30 Jul 2021
 07:50:12 +0000
Date:   Fri, 30 Jul 2021 10:49:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2][next] media: staging/intel-ipu3: css: Replace
 one-element array and use struct_size() helper
Message-ID: <20210730074950.GW1931@kadam>
References: <cover.1627600430.git.gustavoars@kernel.org>
 <8db90c8f5124bbeab20af9c1314439da8f033184.1627600430.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8db90c8f5124bbeab20af9c1314439da8f033184.1627600430.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 07:50:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31c96527-bfb6-41bf-11af-08d9532ea8eb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1565E5E0D95AD03A17FF8C7E8EEC9@MWHPR10MB1565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAT1w92sKmiEg+bMDMBT1nHx0QroN5/bKV1mBQdbWlhbERMbyorJncCJCCdBDMIIN3lMjoe+9p5C/Eo0v1TdYPke/60NPgsVxB5PmKy8IiWbSAIwLfwATj0U/VxqVET/h3lqPtm4Q9+uvifd2G2Eg/E0H/Cl8GQvAfB1mXZWv/+zwgdoyuXBRMIkgGUEEl0tuwWDmp0Se7QGlL5bx5j9XlBfAkG6tUVUA9u5Y1yKe7yAB691YCy5y7X5OLKosOa4JhOIlu8vwAil3zAaocjApkQhLZ9xny/lDus8dQGPO8HFT78CqgGQNM0BcVd3sm9JQQjj+1BP0Db5hkR9AmhxsOjif42Oe42QZBOD5ks14ysX9mg0Xgw6UBzf3Pv5GARAkd07Bq2HUK6AxVvqS5DifcoOpqV+VUaCPzMV2oWuriV+ZIE2eMEGN2qth9IufZ6TMTPSSw0OGWbhjxwSOzWez0vUEtrXJa8DckC8kswquHLMcb/94MI5MYaQVYlV02ArFGLQqEmQRQrhwyd8chUhSwo3zdyCj5K0DtkrrisRZTI68l/zRz2s2b02GFhVvgBCaktfZbhNvVpCnHvjJ2fyumcaczeRH5aA9+rsUN4lxbFoXe9L56UN8fjhO1SYDKwis+h/RJ98/gvKuz2a7VIiiv+geyp7PveA+BTAzSdRo4lfjM6//cJa4TozVgxqalfv/3KuoS0/vX+y4NXanCSwjaeK0sC8jTozoI6nSLmpP0Z8YJktnmuyZw2Tx3cYpuROu06GdziDgdGl5MPJvYWvrp1T+EoCXeo/Taa2aRnvLlmfvO5XC4MQid+y9DVyDr2s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(26005)(966005)(316002)(38100700002)(38350700002)(9576002)(508600001)(5660300002)(55016002)(1076003)(186003)(6666004)(6916009)(8676002)(54906003)(66476007)(33656002)(956004)(44832011)(4326008)(9686003)(83380400001)(86362001)(7416002)(8936002)(66556008)(66946007)(6496006)(33716001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lOVmxtSkhTNFNuRWxMWXJ5TUVLMXVGV2s3RTJ0MUN3MUEzZFVlbnFWTEdH?=
 =?utf-8?B?WWlGUW8xNGkyd05xelN1K2ZkUW9YVXM0Vm9NNU95Q2dQZk1yWE9ZdDlBbmpl?=
 =?utf-8?B?WlRMWVdIMUFPazBaZmV6bFBLc1AxYTZZTEhzMHU5NXJ5ZytjclEyL3M0NEJt?=
 =?utf-8?B?MDlOQUhSN3RVQlY0WDEzblZZQUFhN0JaREJ0M2VFeEtOd3kzQzRwN2hzTDRz?=
 =?utf-8?B?MlJpR3o5YTFrb0tsN0dJTXhXVVdoSnIwM1RKV0ZBUWFKcDZxamZ3WWc3aldp?=
 =?utf-8?B?ak5vWEp2RVRTbTZPZHhUc0dLckdiUXlGZHQxejB6elpIS2FYU05obnlqR05O?=
 =?utf-8?B?Mmlka0VjUFk0MlJqby94bUZzdVZ3WWZwbk9PWlNJa2hwM2ZLT1RRQzFuUXlr?=
 =?utf-8?B?UzNVaCtZSms3Q2tkR25mNWRRRmFJTnQ1UXpIMC80VjRJV0FXbkJGQVVNNEVB?=
 =?utf-8?B?WXEvT2loS0x4Mlg1VmI4V0hnZUhTWXJGTDk2TUpjYlk2RjIzSnh6UEJwMzZo?=
 =?utf-8?B?TlpJdVVuek1aUlRSL296ZjBlOVJvVGtiZGs1bzhtS2diU1ZYZmxsUXhVVWtp?=
 =?utf-8?B?RnROdnlZVE1GcWpBM0t0ZWFxRXhwZFg3dFArOFU5dkp6S1BRQlV0K3hBRWJl?=
 =?utf-8?B?blRmbTViSzFybjFML0hLWm1JYWU0eThmLzJERFJkWDI5RlV2N1VSbUMvUC8r?=
 =?utf-8?B?eWYreVI4TDlhc2J1RlhMcUFEbWM4V2dUajh0S0EzSlRJaWM1QkdDKzhMcVZo?=
 =?utf-8?B?WVlvT21pN0IwaFRwS0JyTGdJMEZKRzNscEdlSHdjK1E0YlZHaldlRmFyUEZJ?=
 =?utf-8?B?ZHpzQnU2ejY2WW5GRkVXMktZZEpLa2dScnZOMlNobVlZaUlmNjlmOWwxYUN2?=
 =?utf-8?B?bUJNell6Z2k3U3Jlc3c2ckVoOHpGdXF3SVhMOVA3eVgwTk1xZWswTC9FWWNR?=
 =?utf-8?B?UG9yRjN3R1Q0UGV0RFJ0SCtRMDhKUDJrQVpNTVdpT1pOR2ZqamlXeFE2ZnJq?=
 =?utf-8?B?ZmpwdkwwaXFpZERaendvMzBtTDlXNFk0SUhtbU1maVYzQStHQ0d0SDAzNmdr?=
 =?utf-8?B?My93MzlCdnh6eHFNdlJqZUxoM25TWjY4VENMUXVuZVhjVkdBT29tUndYOGpI?=
 =?utf-8?B?K3owNVVuR2J1M2hVZ1RKRG5PTnUrVkNTM0NYbFZyaXlHNDZwbjB6MW9xTnk5?=
 =?utf-8?B?dHR0V0tWMXQ4RWdkSnFBKzIvamdwYXNTSU1tRnUvY0RUeVpOQUI2aSt3TndY?=
 =?utf-8?B?bEl5RzN5RGVvWjllQkphZE4zSUhKMVViRFZGS1k0YlpObCtseHNVS3psaytt?=
 =?utf-8?B?NmFhRmM2SFZJNWZaQnZIcm1lTnFZTkdldFplcTdORVJqWkxwUWV1aUZKMGY3?=
 =?utf-8?B?UzBmS0ZYR2FuejNrcE8vQ2dRWXJKR0RGL21WTkpBV0tGUUtvMm9lL1BHd1dP?=
 =?utf-8?B?OXR4K2t5UFpWdURuem8yZkF4NmUwaSsvWTk1VXE3c2wycjdwV3k1RThWR0dY?=
 =?utf-8?B?R2hOYllqY1Rhd2dKRk15djVTclFHaldlTjRneEtpZXF1Q0hFa245L2hFZjdB?=
 =?utf-8?B?a3JJczdKL21WR1Y0dVptYlJJdy93SVhMRmhWaGtGb3JTYVhUaEs2TE9QVkhI?=
 =?utf-8?B?ejBUOS9UYm5zU1RFOUVZRXZFM0U2NE41dzlSdFB3NHVGK1VzdHNyM1hndXpy?=
 =?utf-8?B?cm8wb1QvMzVIZ2wwd0VKelIrOFFtTjR3a0xqdHdUVmg2eTBzV2VwSVd1LzUr?=
 =?utf-8?Q?ZDQPB7VvV7NAhvdsamIUti5Kt6a4Q/y936erfw2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c96527-bfb6-41bf-11af-08d9532ea8eb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 07:50:12.2571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgMWlILOwt132Yn7oBQGTQ5R65+QIsBQsz41u+B97YHWd0N+i68XirdBvElfnr/vJtYo4wd7VQhR7lJW4pcJWIZNS1t2w4NYPMk0At8gi+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300046
X-Proofpoint-ORIG-GUID: sbjLJHPanGNJFhLt0EGFEVfpn02exs2M
X-Proofpoint-GUID: sbjLJHPanGNJFhLt0EGFEVfpn02exs2M
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 29, 2021 at 06:22:40PM -0500, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use “flexible array members”[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Replace a one-element array with a flexible-array member in struct
> imgu_fw_header and use the struct_size() helper.
> 
> This also helps with the ongoing efforts to globally enable
> -Warray-bounds and get us closer to being able to tighten the
> FORTIFY_SOURCE routines on memcpy().
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Link: https://github.com/KSPP/linux/issues/79
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/staging/media/ipu3/ipu3-css-fw.c | 5 ++---
>  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> index ab021afff954..3b7df1128840 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> @@ -127,9 +127,8 @@ int imgu_css_fw_init(struct imgu_css *css)
>  	if (css->fw->size < sizeof(struct imgu_fw_header) ||
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Originally this was sizeof() the pointer which is clearly wrong.  Then
patch 1 changed it to force that binary_header[] had at least one
element, but now it's changed again to say that binary_header[] can have
zero elements.  So either patch 1 or patch 2 is wrong.

I feel like the probably the correct fix is to just fold these two
patches together and say that binary_header[] with zero elements is
allowed.  But I don't know this code well.

regards,
dan carpenter


