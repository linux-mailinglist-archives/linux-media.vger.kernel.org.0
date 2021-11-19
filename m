Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1EC456ED8
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 13:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbhKSMds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 07:33:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46396 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230385AbhKSMds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 07:33:48 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJBalLn019269;
        Fri, 19 Nov 2021 12:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=Fww4LMKAkw1KxndDvijc2ne7e/sB7U6grcNDr5gP5JI=;
 b=QZNadUBM1vmlCpBexwCgz43SMD2HiA5n+dIRBpWNiI5o278uqQTWO7NcEItZ57nzrypW
 vBujBZ0TTsM2dnlOtQEhK54T2Esto++8gB+lKfqX8xK/hGBC0XJNgBMLJyTuLKO9f5OZ
 3Mm+IvJQuHjR/tFiAsbI4u2CZ+Rlkz1Wx/Rm5xX7Sii9X8/VBbFlgZh1l056ffVKFPld
 Ay/VrkwEuQGrJo4ZyxN7Ef4Kp5p7KAqZzqKnTAL5Id75KvB/H1pnQqOkQSe8arbXkMe2
 mF7Zz93lqdWkaaMWM52A9SZP2aNGFWAPzhm2sUKTuiKYyZuFcsF4HrT3iNGAP278IHRU Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w95nr6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Nov 2021 12:30:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJCHCCC104339;
        Fri, 19 Nov 2021 12:30:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by userp3020.oracle.com with ESMTP id 3caq4xsjr3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Nov 2021 12:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXhUuEMpIUSduR8JsWyXQ8kGjlhSxIZ3wgv6uJAXkLTENVtxKdhUZeKUT8yV5g/Pkfu74ZaglIRPCP7ssj6SD/5DXWda1kJOcLmn7Zyo51pE+I9xUK9gt2ynCqreJzqwjfiak3SCVwWlnbbNDCT5CMtfER8QdXmC8cGQQx/kziC59mPyb93Ojs4U2tywiUeAQYETyKWvbUhbvDIqVGl1VVmOHFBOiPu/cYwTpwsahUBCQBUeGsYv8nny8sX6oy762TtTAiwIrbLFV5nCUxCR+0b8n3YmQpf0/UPdejbNiAZDJkzcKIXKi0IDQ4cEqt4zOd0iymALDjkHxA5LbrYNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fww4LMKAkw1KxndDvijc2ne7e/sB7U6grcNDr5gP5JI=;
 b=Wdeng1+VHjVzGDU2fCfmx1XvcUfAqW8qU17/gqioPogH7LhQAGHUZUqRDdE90tNf4iKEA/zBk9VuhKgYJ1oQG/bBU72RwpbOgzosu9sN1GfG6Lzq91Ittay6t9enmCIDyXfNy79ZZLr0zZ+I+w6qIDkbfL3wK8NOevQ7cec6hZwNTkv6G3m46Pvc5WnNPeMNrAPxcica+NUG5kol8CCLlzPRPp9zhYXS5xG1Yloj4jKDRKLsaSUizjctCg/S2+6qIwebXY6QU134liIzMW+R0DSjofKP90MKO4awaIJ1mljG3OYzG0+V0J19+pGdlMPL/zy8a9RiLVPC4U45fD8VMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fww4LMKAkw1KxndDvijc2ne7e/sB7U6grcNDr5gP5JI=;
 b=GiYisA9ZYi/4ilTyJmZFkCE0NEh7X2TO9ZTCdwiK0s4URFY0sEb70EgLR5m5ZdpnV75C9CspGeWzSSSI5v+Y2qFpK5OMUiyw2cGkKlcuVrpl4OY1KuxFXTEuSn2VcN+eixpIYVz8dQ/1Mf4xGnejNuPuG6gv4DAOiKihX/Jwmoc=
Received: from BN6PR1001MB2354.namprd10.prod.outlook.com
 (2603:10b6:405:31::21) by BN0PR10MB4886.namprd10.prod.outlook.com
 (2603:10b6:408:114::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 12:30:24 +0000
Received: from BN6PR1001MB2354.namprd10.prod.outlook.com
 ([fe80::d5cf:764c:ca9c:b21d]) by BN6PR1001MB2354.namprd10.prod.outlook.com
 ([fe80::d5cf:764c:ca9c:b21d%5]) with mapi id 15.20.4690.027; Fri, 19 Nov 2021
 12:30:24 +0000
Date:   Fri, 19 Nov 2021 15:30:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, smatch@vger.kernel.org
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
Message-ID: <20211119123001.GR27562@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
 <20211118061418.GO26989@kadam>
 <a7238d27-6f9a-58ac-1acd-44fa6ea0727d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7238d27-6f9a-58ac-1acd-44fa6ea0727d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::29) To BN6PR1001MB2354.namprd10.prod.outlook.com
 (2603:10b6:405:31::21)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 12:30:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bb87a63-c2df-4113-e9c3-08d9ab585bf1
X-MS-TrafficTypeDiagnostic: BN0PR10MB4886:
X-Microsoft-Antispam-PRVS: <BN0PR10MB4886E04C67B4F87C9C3D3AC98E9C9@BN0PR10MB4886.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05bwHPWnZPp0LLQqInR8t5v2PROIPzhmU6s5s4F2ZXxlKqnOgu855ihuoJlt/UlQpgeoHDYOCenEfU3DI6ao8NzVE2icNegqa8jdjiJdNa/3j1icLkQYN+n11AnEws3viGxx8hJy6bXcTvpEdJpTY6UWqjjRa4oueS1Gg+41cuPPLPtKNG3rAJwj8N5nuIqJwIw3ipusOzRc/8/PVL1n+3zdhrvIXVYtWvaqSLxBvpG9wv/GOAWT9Oh71nXXBaKCKbaPOjaoJgBQH0144WN5TUHwgbzGULKI3XlWb6VviqccwS8eGT6qqwlFZPP+dTen8hPdUxdnzHceUSXmNlWDPWHwOJYKPDSrow6suqi/Ls4MYuALH55rVCzVoOiZjX7HXmvKQIHXAUb3sTtLWcUuN7lswAqNCdMAoRFgrzhQUh/bjqgbDjD1n5nFNcEYvjsydo9aL0/vYIJNTlzAUBgyMM2P6kbJiVWhGEwjXzv+nWSVImWXwu7JOVXQbXWCCKCklDaBg3zy+gAjDFUEtu8Tjt8dTMXsxAX+mHFWQ6S7fZDTY6As1Whc5lWfOImMbRAlq73ZVD3R/33D4xDw0r+ZUxMCZJ7Fezt7MfDK5wbdIUXYuTTR/oMD77x3i+MSVrpRccN6Ad7kbEJtoWdg7qZA4SmgqczjsDq7dQkr2KYfdsttoGRrEVuoZO5PeNTv5H6vEm4yTGAr4LVsp8qYMB2hB+7VYv+HPfpn2dVlnoaHUgN69523mYWRZ3VBtmODh/lZTogQwREUpTDFAIM67RdoJUqRWQMn4gQYQZGAcHb+j5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1001MB2354.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(9576002)(26005)(6666004)(6916009)(55016002)(956004)(508600001)(7416002)(966005)(5660300002)(33716001)(1076003)(2906002)(186003)(66476007)(6496006)(54906003)(66556008)(66946007)(316002)(8676002)(38100700002)(44832011)(38350700002)(4326008)(33656002)(52116002)(9686003)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9jMkdUZlBSQnBBaW5MNUp6L3h0cnJjYmhkYURRMTQ4K0hubXA5ZTdzNkZG?=
 =?utf-8?B?eVkwaDZvU3dvangzRUdZT05nVytFY01VQlZldFFDd2dFcmdIcm4yT0dwYjZL?=
 =?utf-8?B?VXlaamd5di9vbmp3YnIwVWlsTjFncHpDaW9rVTdxdDdJdWdYMGVUMlEyTmpt?=
 =?utf-8?B?Ni82TWpZWjYyMkNmN25ldG1NbWdqSHYza1RVS28rN3NaTEx0TlBXTDNJRm1l?=
 =?utf-8?B?UE5YblRITVlxQTdWU0VqNTJSeXBKeHB4UkhSdExxOWg0UlZINzlwNGlITHAx?=
 =?utf-8?B?dGhjc1R3Y1JlVEZlNFAxam9JY0lyQjNjL3l2SElubmVxRDNRaGwyWkhIaEcr?=
 =?utf-8?B?RkkwaDZheUhJVVFmaVFvSC9wckRtY1IzbWg3Q0dMbEViMkh2MkNPRGtiNDQ0?=
 =?utf-8?B?aTBaakhueDJNclZYUlB4RWU0bzhMUDQrY3VaVEpLTlhXbTR3QTVXS3ZnWlp3?=
 =?utf-8?B?M3FhYkZOdGZtTXRHczhIci9rNHBQMWRDdjhMa2NhYkhFMmx4VG5QRUhFYjdp?=
 =?utf-8?B?Mlp3VFhDTjVaQmFjK1VIM2JhNTBCdGF3WTVXV09SeVVGdmdON3M3d1NFRkM0?=
 =?utf-8?B?QU1wOGViTUxaSjc4VHRxQ2d1UEl5Rk45UFVTRXpTcGVFNnkyMjVnNkR4Zjg1?=
 =?utf-8?B?cWZZQ0h3ZVl2VkJJejNaY2dFeGI5cGVKRkhvb2l4S001OVd2T1ArUnNOd3Yz?=
 =?utf-8?B?c0Fyeml1SmRJc3RmSlRPR2MvUWlkcjlwTTdCaXVvbXdGV3lPVE9DVVYvS2tS?=
 =?utf-8?B?cVRhUDBtMERjYVp0c244TmI1TzBpdWZEb2FKd2lVYzg0SkpmQlZMdkovZGhP?=
 =?utf-8?B?MHdVSVFIU0twUXp5WXltWXhOcmtocHNvWXlHYzZSSVJtcm1STzV1UnlKS3Na?=
 =?utf-8?B?dVNSSSs3eXBIR1BWV0swRmwyLzFwVEMyckNWV3dza1hhWXN3VmZQR1hsN1F6?=
 =?utf-8?B?SloxQjhWTDhpMkVOUjRXQjFZQ0lSYmdXMjRYRXUxT3lMUmVpOUpndzVvVkhI?=
 =?utf-8?B?Y0Q2b3JCazRoUU5uZ2ZxODEyMm4vNmFXWDVmZ3VsU25zTjJTNWVlQXZJT3Mr?=
 =?utf-8?B?dzNscFpna3Jrd1dwcS9RWCtmYi9TQ2FCSlJFNlB6WHFDbUcyZytMVG0zeUxC?=
 =?utf-8?B?cTNjRTBjeExEcExRUUpDaFQ3S2ZCWjNHclBXRmRmL0RzTExkejUzaW5xWnE3?=
 =?utf-8?B?OXFPejRpTWM3OXkyeXBQYW0xaTM4Q0w1TkVld2RMMW8xMy9PRnIxYWl1RDla?=
 =?utf-8?B?VGFXdkhpMVQwNmZpTE9qT0hxLy9VNlhVOUVNcjNGbTdQaVgvTHhOZi9JcDAy?=
 =?utf-8?B?Q0lOU1drL1FRRHVCSkNHaG5MRG1jVjN5cEdpZTFoSXNIL2l0d1ZGYStKbTk3?=
 =?utf-8?B?V1RiSzUwSUh3S1BpbDMxM3FyV05jOUdEKzdhdzJOU3ErWXVPazRTNnRTZGFx?=
 =?utf-8?B?UFF5TlJyUXpYNU5VWEVPTFZ5dDBVTElRcmNJRExNeml6QjRkb1pEaFhYK09s?=
 =?utf-8?B?OHlQd3o0b0NMS0t6QkY0WkpTU0FFejlwR1prNnlicGY4TFhzRFNEV21lYUZq?=
 =?utf-8?B?UmdLRDRHY3R3SGZmZXhCWVVqdTVtMkQ3b3FtNTYzcFl3SjJZRVd2SU91Rklz?=
 =?utf-8?B?MVNTSlJGdGlWWFM0Q3RNWnFld09vZ0JESEloWi9lZWkzajl1L2Y4S0Iyd09S?=
 =?utf-8?B?WjdiZHBydlNjK0txaGVsUTY1OVNNa3VkYjBPR0g0SlE2YmVYcHlnblFVY1dF?=
 =?utf-8?B?ZzM4S3AreWhwMXpWTG9Hb3dQV1NyUjNTL3hJRTR6NXE5WU1KcTNNa2JmdlZh?=
 =?utf-8?B?UkN3SnFmU3hQcmJtS0orVmdsK0Y5RnhUREV6dndURXB5UEZydENKQmNhVkhx?=
 =?utf-8?B?Nm1xMnZhRDVTMElUMWE0bUxDenN3QmZ6QWZZS1RMc0dFaDdGNUpITzA4YXow?=
 =?utf-8?B?M3FVOHhZQlVMNFFoWjM4N0JlNlI4UGZqK0dBakFkb1FJcnZRaHluamRhRXdZ?=
 =?utf-8?B?Y3JqeTFzNEhmWjhHTnpMN0Y5bTFPekthUlRHNnNFVWpRL0s0WjA0M0FuUmFq?=
 =?utf-8?B?OFBpcXdRbmRwQmRoUXM2bkJjTG9ES2svVkdHdHg5ODdSWCs2YVhTeTkveGw1?=
 =?utf-8?B?R1diZy9aQlBnaDZqb2w3SmJSc2hJd2d3N3FsR1ptaE8rNjRtY3hKKzQ1Q0lQ?=
 =?utf-8?B?ZjRlblJnZ2Y1aHhGNEk5UGcwUnh1eDdKZnRHalFyb2RleVZ4SzJ6N04wdjZF?=
 =?utf-8?Q?KM8DZf8vvJ1EiuK1WEkUw5/Yvurp827aOkHKWjh4r0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb87a63-c2df-4113-e9c3-08d9ab585bf1
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1001MB2354.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:30:23.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u4wUGm3cdmBv09NaKzx3kHIkVK3l9C1UMaZC9x2NhYjCTexnpyZl/j9i8kzHyQPamB6ieEO5GjC7EWC+mF9VODU82V+ujXOPLsacruBUp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4886
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10172 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190070
X-Proofpoint-GUID: 2WwBK3TVR867oBkTPdNIuPccfBcuH2Jr
X-Proofpoint-ORIG-GUID: 2WwBK3TVR867oBkTPdNIuPccfBcuH2Jr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 18, 2021 at 04:56:38PM +0300, Dmitry Osipenko wrote:
> 18.11.2021 09:14, Dan Carpenter пишет:
> > It's not hard to run Smatch yourself...
> > 
> > Depending on if you're on a apt distro or yum distro then fetch the
> > dependencies with one of the follow commands:
> > apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
> > yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> > 
> > git clone https://github.com/error27/smatch 
> > cd smatch
> > make
> > cd ~/kernel_source/
> > ~/smatch/smatch_scripts/kchecker drivers/subsystem/
> 
> Thanks, I was running Smatch couple times in the past. Finding how to
> run Smatch isn't the problem, the thing is that Smatch either isn't
> packaged by distros or packaged version is outdated, hence there is a
> need to maintain it by yourself.
> 
> Also, is it guaranteed that Smatch will always work properly with
> linux-next?

I work against linux-next every day so generally, yes.  But that reminds
me that linux-next broke while I was on vacation and I haven't yet
pushed the fixes.

> 
> I imagine more developers could start to engage in using Smatch if
> kernel supported 'make smatch' command which would automate the process
> of fetching, building and running Smatch.
> 
> Couldn't the "kernel" version of Smatch reside in the kernel's tools/?
> Or maybe just the parts of Smatch that are necessary for kernel
> checking, like kernel's DB/scripts and etc. Doesn't it make sense?

I'm not sure that makes sense really...  I'll expand on that in a bit
but the shorter answer is also that I don't have the bandwidth to make
it work.  I just suck at releases and testing.  So this would bitrot and
be horrible.

Smatch does need a better way to manage data for other projects.  Right
now linux-next is the first class citizen.  It's the only thing where
I'm positive that it gets tested regularly.  All the data in
smatch_data/ is from linux-next.

And also there should be a better way to check specific version of the
kernel because people quite often use the same directory and just check
out v4.12 to test that and switch back.  I do that and I've got scripts
on my system ./switch_to_tree4v1.sh which set up the symlinks for me.

But for linux-next it's fine.  Also by the time kernels have been
released the remaining Smatch warnings are almost all false positives.

To me the data in smatch_data/ is not so important as the cross function
database.  And the cross function database can't be distributed.  It's
too huge and it's specific to a given .config.

regards,
dan carpenter
