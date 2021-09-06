Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D93840183F
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 10:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237880AbhIFIu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 04:50:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34024 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237117AbhIFIu4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 04:50:56 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1864QBJT009186;
        Mon, 6 Sep 2021 08:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=fqHzbreozPHZDDCOji0jC2kyxWlpKkoSiyhfz+cytPU=;
 b=V0cZSg4zkhq4b41Gch4hf7/3RTSfJ6Y7/DPjJUiR7EHgbU1Hb1jz+j4xqdjuJfnXAgSK
 rwLUa9vI34n2vQFktqeIaFJeCUsj40q5yS1LdyhUxigI/eqI0pWtuRnnH3cuDUWCXG8e
 ESK1+taMaMAniU+t7OFITLDQeYGM438q9Krzxa7eVmt0ZTo47R8y0q2Z58RtynQldWde
 xLxEVfNhrwCE4p/3JvQUdnJd9Xah/9rxWgjGZSyI2p9DaYxooQR1k88qIaWsS98eR1G2
 c0F0n01TdNF3xmLYpc7VOMz1GIys+26NLY3NR/YZPjfK20+0k2FZWD8rUDhPqao83LOa TA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2020-01-29;
 bh=fqHzbreozPHZDDCOji0jC2kyxWlpKkoSiyhfz+cytPU=;
 b=Ah4lHPn/yE5GDM+4tsVznCaqAh2fyscroWJVXd3OThDQ4wVZsRaGMjDD6oAk63lHdOxK
 AQLvElCTQNsnby791LA3Kmda+YwmHNUDpyKKYf/mG/12zJq/tpFEWU/DxjsQhfxoWS77
 sD0PvTIKfqtZXdrRwDYECrMHu4sVtWBh/unGzMnQ05OQJH0UtyYq+6prPrtdGWL+DbNT
 RYBiAx0EYJvWu/Muv73GRSyLZOkd5Ufx1U0nBgEcJwMlmz0w8KLFrrLUG+y9MCo4wKxI
 DUyBf9+CKDcRExoxqAfrz/ALqnID8M1WPJ7APYeDV1H0habnnaIzMP4Wwq4GqT9fwDoT bA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3avy6ysjkd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 08:02:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 186804MK152690;
        Mon, 6 Sep 2021 08:02:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by aserp3030.oracle.com with ESMTP id 3auxubx1rs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 08:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ/wZL+jGu+gOLs82QT6RmMIHsdsfZeXputjZjnHWlI+ZEdXm+IEicFomVMRp/ggCFOdrp5bSwvDZW9JOUfFC8hImuCDxpOZxhWNIqAjefYQUKcumUDLcmvNd4FVgMi0/yGe8sJaqb9CBFCDWykOJTjcadPqAU6lPUGJjeI45OX+ilEpGrL2kXAMQKVW6ExeZt/Ho+tfiraZM1O8KFCArOUaxpY0Ii3DMoyR7Whaqi+VofoxhpyYJrr6xbRAEpq26eoC3DZPEmWYpb+wkGAylDqRpjp+1YDkBNefrN/wiGK5q5SVyNf7gHvmrqdZjjVN/Qcj1At/7nnl29OiAnJUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fqHzbreozPHZDDCOji0jC2kyxWlpKkoSiyhfz+cytPU=;
 b=Vs9HIAFsPRHlbtJn6popVUbNCWXNOEBrH73Vdhn27n0Dn6ozvqLlZpcgk5w9mOBW/znVi0j7KEHuxVzZO4Afx1PMMzSm3rRqiAmYE8hZUbP3Lb/s4EWncIKIlnrhQUGPyrHo6fQt/FppyKKG68XiavD1cVKi/srbtKYZ45E5kDflTNRNTIX/jlawEcivle9ajCUkG6aoVRhLe2Iocg9PjSzR8pTdu7/m3A45j0tbic0ww6esP8h704Q5fPSqDtq+xaw/IxiJpVS6hzWxc4F1H2nfZA1Qcrw1/h9fEBeI11lYNbdzHKLgTXGKkYQNCBSjbKdbedZHw2LyEHd7KqtRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqHzbreozPHZDDCOji0jC2kyxWlpKkoSiyhfz+cytPU=;
 b=LNZmn+Q+doD4qby0ooF4Dd86tjuYY8e1Ex5u0lGuJ5sm5h2BryijOaSxJaxWvwgHDAzN36vOpafwqgHZ9hT2QJQSbDWip466wSx2cOoKdeV0vTqn7FGe7ZvSJItNJQDueWg9a9CmYSMkp7v3j/JKSsUpLcyLItG+TEdQfBzjFtA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1422.namprd10.prod.outlook.com
 (2603:10b6:300:22::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 08:02:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 08:02:02 +0000
Date:   Mon, 6 Sep 2021 11:01:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tong Zhang <ztong0001@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: atomisp: fix compilation error
Message-ID: <20210906080144.GJ1957@kadam>
References: <20210905191222.612949-1-ztong0001@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210905191222.612949-1-ztong0001@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (41.210.143.41) by JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 08:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9345ce4-a869-49e3-b980-08d9710c9c17
X-MS-TrafficTypeDiagnostic: MWHPR10MB1422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1422F445BC0BA3847DDE0E148ED29@MWHPR10MB1422.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXKQAkEj/KTS/iXN1YcvnNJP3IGimTRRt376EgE/GVfS7G2JgVJg+TgeEqXzw+w4DWjk3ROBwjX51nHMETVC0dV6L98cIZxfYVMs6f+wTepdnoQCuqKT4/Fr2fgR1apddX3HRvhmShe5Sv048i3rxMNA9ug3MpsMsODVUM/tSX+VigMnW+rCVM2tkXlyXsUShqwTMTZKL6pd4yiZTTU2cZ87JakaeawFl5IKW0++Q0m0ZmodbpFW7GP+pg2F3b3wPFi4mgAZvN7GfzKAm86EXeAAoAa0h2iygy51ulqlzcJ1Q7SlzV/fhB2UA/I7fsxPV4B3NQkNyQ1MXsZXXBsjx12NouN9dlGgfHfJCdtvkg33a79D8UCpOG3HukeXQ9ktMdx2GDyg9Z4MhDw79iFzOVU/sIPZslTbSNTrT6B8uA4WbYAIFVBlvKR/Kg7h7dqJyzozW4kBnFhy4ipCYu5TvgxRcz+H3mSyh3pZqK+KN+5R7f2uFBGM23nW4lhsL0sIBP/IpiEtB8GIPiRjzCleJnPHjWBVt/sE9CEvy5dW79yTIQSuxfnoIf5X19lHmF7Scp0RusMzsoZDovKaSWixdru3fSD/uuxYf9loJ46kMflCZ+dVP8jYGCYafM8I6r4k3+ZQ4W3p1TRcXj8NVV3iNfXPy+DkadB7xSldDp7EvAGsJaUJNH7hZ9haFUkAdRHcaVzARg83DQmEkLFI74Dko4FGTwCiYXvfqsHtbJ7pOew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(376002)(396003)(316002)(4326008)(5660300002)(478600001)(8936002)(66946007)(83380400001)(1076003)(33656002)(186003)(2906002)(5001810100001)(956004)(4744005)(66556008)(86362001)(26005)(9576002)(66476007)(6496006)(52116002)(55016002)(8676002)(54906003)(44832011)(38100700002)(38350700002)(6916009)(9686003)(6666004)(33716001)(5716013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5aWWNqRk05NndSZnhicVJ3MjBtdkorSzZRZTkybXR3RmtOaGcxZk55YmFW?=
 =?utf-8?B?QzFCY0l6TzNEVC9kZUU2RGhaZk5BVmY1Q0ZRSlF0NFFhcEhDYnFPMXNFN3FM?=
 =?utf-8?B?OFJ5dmlrTkE3OE5HS3JPMlI0Wnk3MkN3WCtwUlhpbnB0Y3hoZHNUeG5xaHdP?=
 =?utf-8?B?cGJzSEtjak1YdjhZUzJYbHRJUGxWUFg4WldLbEMxMW8wd3pKSXBocGZ1T0Iv?=
 =?utf-8?B?M0QvOFZQQnk5YUFBcXY3cW9LV3lnVE5sRUpBY0taeXpxSkZlRW9PV0o1cFJN?=
 =?utf-8?B?MjZ2aTdOcWQrWG1UcnBzWE1YdnJrRHpZaUZwaFZHZExVSTRLNlNuWlJIK2Iv?=
 =?utf-8?B?MDM3TXc3Y2JzTVZFd2U0ckZKWjVqN1h3STJDbVRnMU40ajkvM1BoWXcxRlNs?=
 =?utf-8?B?UFJNQlBXQ3M4WlVJWWFFakFnQUVCbVhQZ3lVMDFHQm5xSzZqdkY4d2VxaE9N?=
 =?utf-8?B?WTVQVlRBMmhoQVpaU0ZLWS9EakFRTC9MYTlOOXJIQlA1Q1R4eStpSXNuclJP?=
 =?utf-8?B?MndxUFRGQjh0UU5VbGVFSGhqNzRiR0NXZ0Fvc3BhZ3VtRkVmcU9qekd6TFg1?=
 =?utf-8?B?Wmk1UnVSemRWMFFJNGNFV1psZlZEMFdhaEFJaFplM2xGMUlmWUtoVFBkMFcv?=
 =?utf-8?B?anBaRXBQdmZNaUtqMjFBK0RvY0I0azZ5R09KN2Q0TmEwdnV2TGY5VHFkNGs0?=
 =?utf-8?B?Z0FEdTdxQ0ttOWJ5YTRWaWUvT01XY1AvUkQ1NCtrc2N3RnZ6cGY3bGFJeFVh?=
 =?utf-8?B?dms4Q0N6dmNnRjhFSlBDYmw3N0dQT1dCektieXVSNzUvRlBNd2RGT2tpNFFi?=
 =?utf-8?B?TGRiOHpLcVhkUFdJZHBqZldseE1iaFJucFMwczZDWmFVbysvNC9lRnJvUmc1?=
 =?utf-8?B?bDV5QkhTTzA2L2Q4cUpyaDhlQTduejhpTUNqdzVZNXpDY3RiZStrZ0VpN2pi?=
 =?utf-8?B?ei8vckp3Y3hNckNKdlZ6WTBrK1F0VXpaZ3lZZ2FxSGRBOW11Yks2cDJabXRX?=
 =?utf-8?B?UG5TcUFlRkYvem5Vdm9hYTArRGhjWVl5a3dUQlB4bDNwZmRRNW95NXdQR091?=
 =?utf-8?B?NUFCWHFkUnJUMmY4MHJIdDR4bXZLbGxEMUhzMThxMU1nRm9xaWFmN09GSTBs?=
 =?utf-8?B?YTY1aEJtbW8yZVFkNFFvK0owRzYyYXMvd1NzTGp1WTRIa3Q1cWVTOE5ESHRY?=
 =?utf-8?B?NUFmZTFDV2llMDUrUm5Bd0JUck91UkcyS0ZJWW9qV3VWRVorUE4rMitUQ2pz?=
 =?utf-8?B?akU1eWpaa2RlRnpraWpnODd0Z3ZiVzdIZkVJV3dqM1I1TGJGWnJpcHlqbjVl?=
 =?utf-8?B?OUg4dU5tVVdjVlRURHAyVk5LdkZsQ1BscTUvcVl6WnBYb3BBTWFrb0VMY0Vx?=
 =?utf-8?B?dmFoQnFmazVqQTE3eVdyRVluY0dvTTZXSTlGSGNOUldJeFJBUWxXaXEzTnk2?=
 =?utf-8?B?eWllLzhVODhqVVlIMXpOdWNrS1U4L3BmM0gvOE9WN3kyd2YvRERBOWRWRnNw?=
 =?utf-8?B?NEtNRjh2YjBNZ0VPN3h2UjhUelNoUTg4ck85U01NMnR3VGZpQldyeThjUnl4?=
 =?utf-8?B?YjMxUXV5eU5yZUZBRjhiM21KS0p6S21KUFdVSHpkUjVvalpxT2JQU0RFVFhW?=
 =?utf-8?B?aG1MK2tuNDVadHoyVXdyZjI0U1REQVp1MjgySERJQUtneHdBbHF2L280WDVr?=
 =?utf-8?B?TmYrVkRHMVFUcUdPVXlzdFViRkdDVzQvRlFyNldhUEQ1T2c5RnVUUUx1Ty83?=
 =?utf-8?Q?0kKNbUDdQxsYdDa4unNabyY15IWcWsD72iynBIb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9345ce4-a869-49e3-b980-08d9710c9c17
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 08:02:02.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnuwBJAYWElmj5P/oqImVGdr/OgfQOgEQ7so2OM3RAwwka6ekTBKOEgFb/FlQJe1/ovGy6sGlkQI57Mxb+DLzW6/MZq6AHlmCvUDi2THiqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1422
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10098 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060051
X-Proofpoint-ORIG-GUID: PH2MY-ztnbVUAHS_xGLlBp9_k0SAMbOe
X-Proofpoint-GUID: PH2MY-ztnbVUAHS_xGLlBp9_k0SAMbOe
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 05, 2021 at 12:12:21PM -0700, Tong Zhang wrote:
> I am getting the following compilation error on ubuntu 20.04 with gcc 9.3.0.
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>  1649 | }
>       | ^
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
> 
> I made some minor changes to the switch-case to keep gcc happy.
> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>

That's so weird.  This is the second patch for this I have seen today.
Meanwhile it was fix on Aug 2 with commit 05344a1d2ea7 ("media: atomisp:
restore missing 'return' statement").

Btw, in the future, this kind of patch needs a Fixes tag.

regards,
dan carpenter
 
