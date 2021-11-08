Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD5A44987C
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238299AbhKHPhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:37:07 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21268 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237570AbhKHPhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 10:37:06 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8FFa7r016807;
        Mon, 8 Nov 2021 15:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=0tHcxwdych6hCpbewfI9d/ClOKIRiMKHT++7mn4/STA=;
 b=KtVONQL5SHj+4i0JtpO71vB55TAMaR6ltOkIp/W47EZulh/XA1NxvKsNu14h6GEPBLfw
 pTNMWpnUx+W5bdWvvzwt9mHQ3dI0q4CuUE5D2rjyqMjl1Tp2uYbqnNz4j0xsQ20GonRZ
 64cL+U21NwJfgQrUwJYAHm2U4V5f84dvCc97CnHiHdLHTyqW8P0vRKJgP4uIeLZTqMWL
 MaWd/REta5IAoC2QIVfOwTT2AAoe4cWOgtSuMCoGynbrgwq9f6+dKuVljhFdE3YZoaqP
 uf2h83rG2XKqLMqY8UMybhConWdtGaCemNNHGqQUJKnS2h0TD6VlbojGR5voaf/cqg6/ vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c6vkqunka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:34:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8FK7Dr060669;
        Mon, 8 Nov 2021 15:34:02 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
        by aserp3030.oracle.com with ESMTP id 3c5frcfh6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQb4SuE4Tp8cgolVJydHRZhgekUHgvYH4A0YklsYUDMZM5QFcDfgAQuyxo9DWMAk2ewkGZbrCtjsUeysOcin2+vXRnl/xexiDJcXi5JmCe3/uJQcVZDYl9YD+8siu5kiayXmw3G5BHIkU+GyHs5vujRBwQXZRen9az+gbCRNrY5oapiywZ+2Q2scugOjOTgbTwb/Z2qfNZbokBqnTZAMnBMuU5QMAp1pnqN2d21P5rBAmWU2NFJYeNN9ngFJoDbIekWABHc8PzTS63lAH1fiAynZSdfu9GTPnjO55o6fwRp77UJe43ZJ9tUOGIUo1ElHWIOrugNW1cs9Pvy9AzdZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tHcxwdych6hCpbewfI9d/ClOKIRiMKHT++7mn4/STA=;
 b=UCvzFVNlD4MLR4U2gfJjfpc9z1Wz7NsVTUTTaUSuyLbABMgKVtONSWIeO8dqeM/KyNGQu+gkAhC17uXz3rITrcdgrSPRm6tomK8eIfRZRPLHNtkKb3clt4lLvgl7axkKHTRPI8KSi39DG2nOn+2AbEFQA+QXWFTR6/3P2f99Ew4N48VNeGLeL+PiMwCzLe6zLszmGYRjO1D/qENOnN9Q/mAojz+q0NJYfIWL1rU5VdHW+Wc/RzP6CFD3vUrW9i1y2l/PtWYVs2KRJpCa3CsJespmDjdH4bwinHRUbOviDE0WvIby1BTg7L5oigu4MwjVgXtVsxJiqk5J0040vKIw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tHcxwdych6hCpbewfI9d/ClOKIRiMKHT++7mn4/STA=;
 b=ehMZpyrKbIZk2MHtZqIFi1xaJNZuYSMTNmLSMuFCxUNYThv+qjYHT7IXF6cdmULMp6hJUnqx0VBWvtJnn+i2LsdbOFiJrONGGUxrYI2XXzAIktMbLXx3cy9KCJ+tLlh0yEM3hFdPyVfPHwbiOt794H/v4N+2VZmeDfIKwRsQqiA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5849.namprd10.prod.outlook.com
 (2603:10b6:303:19b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Mon, 8 Nov
 2021 15:33:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:33:59 +0000
Date:   Mon, 8 Nov 2021 18:33:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
Message-ID: <20211108153335.GG2026@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-6-kitakar@gmail.com>
 <20211102113332.GC2794@kadam>
 <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
 <20211108151455.GI2001@kadam>
 <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 15:33:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1295ae31-a0d6-40a8-9d51-08d9a2cd2f06
X-MS-TrafficTypeDiagnostic: MW5PR10MB5849:
X-Microsoft-Antispam-PRVS: <MW5PR10MB5849911B470C75FB7189A4138E919@MW5PR10MB5849.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Di+bXrf6AVdFVy1tStffUcmIO+jE8mmHeHrtaSF+/lKI40WP1Lt0xJ2gyHmChuV4DtbkhBIi70ZScTXVDHKRpWJvCl5dBFXTQLEscHkUYwpDYK74eVW8qurjqskBKYhM+uSnGZOeEnfbct1VLdOGpyQ0OFvRHbQ/bUOpev0IPaQ00WH+pUEBn2ZA5Rb04qTMhS1zWK3XQcmuKsu0bduqpqJ05BgVpp/sB1fSV1MXLovOlmcvYcmXG8deHmr0txrO2V1njlghZRvEi9zksFBDfaVCRh12AuRx92962KFTzM+vdTvSr+tXDVknxSfLtF0BC+9TM84r70MVO3LqvYv0HgX70TIcbxe3/sn6Po/cEYILICyAnqk77C3y+VbJF+fPLVVPjcorK9qN3Ndye+BbRIvcfKmz9uf/QSCPHLjXoMIU94W5PoKhjD25dp8iAlIjBIGU9l5nbcAtDDXbITohpJs7d0Wx4ppgNTVipaNdrso1FGiA7APgriv0Ds5tb60vLLelkjWGBOLPGT7frbNjFZjwbRM0yIV0YnjP0GUlR3opAtcp9iCEzCMjh5avaAAhU6o5KgmS/m03l+qcsAAz/G999A0V9Rq2kFGEFIFEP6VswknwLdroizviylWZfve0cKV2IaGzK6CFObr//R73grHZ/ErN9RIbkuqi6l/Uroyo0qvTfaQ0ed2vHvSSLdBiI7l5gua+uoY+eE6UucN75w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6496006)(54906003)(956004)(4326008)(44832011)(8676002)(1076003)(9576002)(558084003)(8936002)(508600001)(316002)(2906002)(7416002)(26005)(186003)(38350700002)(33656002)(38100700002)(6916009)(33716001)(52116002)(66946007)(66556008)(86362001)(66476007)(6666004)(9686003)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nzvezfxS8WL1T4hQ4dZ39PiH1zQMlckqeF5Zb0PHnmDPPfAbMH9DOIh7L4Yo?=
 =?us-ascii?Q?5ueKMoR1Q+DYjXez1kya3DnbGlg3tORrsZ9CDuno4waQJyHNM7pjKzZ5xgzS?=
 =?us-ascii?Q?pj9T+X/LhNgIQM9tTInLWdjcIY4k+/WQDYv/2ZkcNIyCa32yLXAB5pZuxnGv?=
 =?us-ascii?Q?knITnITQZb6Seof7jfBRw8vDnuNJBmjP7UxtJ5kLxEW0kqvKnlds1mTQEYva?=
 =?us-ascii?Q?7KmDiSZ788sO9CyeREoZB0RFlkjwh5WTG0mbSvrkW6y1fubkxPmKgzGbh6vc?=
 =?us-ascii?Q?WXAcIucdcinNSQHJzHl4bBeHoMptV0TipLXdXmybHWoUHhYipEH1RnuWeC6I?=
 =?us-ascii?Q?D5If41zQk+0AMRVWr9Z4B+PVoezhsknF1HAxgqrdtCff6gElgRwrNjc3y0mN?=
 =?us-ascii?Q?eNYg90/F7SPW2uhD+V2ezdAiY3PfXhPHurUGxOZkW2aPRiwXSWPtzTmJKxgp?=
 =?us-ascii?Q?/9/T/pz8aoQ74NcF7qcR6714h7hY82bIPOX1U6bvS18Nruh3b3+fZnl1dsSR?=
 =?us-ascii?Q?wYBDumO8capTKZGwVq6+o5hyBCTtUDJLIJcT7eyzBgm+FqsazmrtMTsHFUo/?=
 =?us-ascii?Q?/FERssZ15VCynDL4uv1g1SA1yBu2cJagkEy+DN4YtmFT/aYW4a0tkO2XL2bz?=
 =?us-ascii?Q?Zg5S3Ixfoy3CRne31/gmjBRpuW4T1V2YmN2FPq/CwVr1nVf+UNzAvvuloe4q?=
 =?us-ascii?Q?/2WX0xqJ934PJ8CvGkNioI71kddBQqf9lEa6BsxfxOxmx96kFCBpgltyTtTf?=
 =?us-ascii?Q?7X5bRqzNnoiGm2yIsSHKjrp10FNVhuI+1C/vZTy7cH2MEn9eklUSHv9xYd2z?=
 =?us-ascii?Q?MyvHnM3LK/7sQXoSzDzbv76N0RKfglj+90E0/RF1t7WnFiFbsz/PZaVuN7U2?=
 =?us-ascii?Q?ekmP2lOjabSNU8cSzF0IgW8OhymQq8mKeISsFaebL+HkJOt0W0Soj7roN9bn?=
 =?us-ascii?Q?vHleyhi/DcfUf4ujPuyE41F6NNY4GMCp8EyivfU68B7E7kc3uGlYNhUEjQwi?=
 =?us-ascii?Q?3Z/fydLbCk4fngB9MVf3Y0/jvcaSk+MNlwPTW7AQy+mKuMgqhv7+KM1Hc2sL?=
 =?us-ascii?Q?T5zwKbMQDgcaP8R4a5l57jv3vVCqlBMAZ4el+iQ+LwAWhOpaLE5HU9qx6TJK?=
 =?us-ascii?Q?lhkqA/4nXXEEZ9lNBZtGegUgJWv+8DOlWPSkbbPhuD50iNOjF6SJA51qRNsg?=
 =?us-ascii?Q?y7cdT8Afqv1fAUJagAl31AeV7QXk4/sJJzlsE6ljG/yawbDBnjyQTJy+fKha?=
 =?us-ascii?Q?B2COoS+pUBpGycp2Ggwaq78TOrWyT1ecVUBMmc1SNCHH8FGSjre6ZukhKegO?=
 =?us-ascii?Q?WnS8tjkK0joshtrKu5d/t0hMtElKzir7pklg7KFs9HsWLfYx7n+KHjBBTZ3G?=
 =?us-ascii?Q?6fyHw6KzDyJsv1At7Mwt3jPgjQNpIZyNXaiGV8D7V307NAAFI7AY8GnDRSjR?=
 =?us-ascii?Q?aiS34Z/y6RQv8D2ffeq8pJ4NdRKDoFNVvc1q0mfe1tjY7CYTmZhSeNB2/v6b?=
 =?us-ascii?Q?pQgW6OjpRLkZmlGv2SRCy+u5qdt65JjBqpIxoA6QRKxSB7HoRkmXQwjd16l6?=
 =?us-ascii?Q?u6Sh8dIrEADM7k4amx/0qwIXVfsfrGAaOjxGEJqsmIau7KWK1n008RScd7xo?=
 =?us-ascii?Q?8fQC89XS6MDiekHObkWjho75xp3fjDbpsVrDeqKVkgyEIC9R6Y93OLSi1QYW?=
 =?us-ascii?Q?4ElpHnITqdAX7PeY0FFk9BUDKsY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1295ae31-a0d6-40a8-9d51-08d9a2cd2f06
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:33:59.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmePV1fDbg/+293IQ7Hv9Fc8pSEhndKR+XsZWCwX2+er8AIAkv1vMk4ldwMnaZvugwF95+uGVmnvVkY1TJnK1m3xNSQcs+LeMoP9U0PBIHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5849
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=889 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080095
X-Proofpoint-GUID: mL7tfAZTqZjdrYYe8VM_KnhzB3N8C-SX
X-Proofpoint-ORIG-GUID: mL7tfAZTqZjdrYYe8VM_KnhzB3N8C-SX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 09, 2021 at 12:25:52AM +0900, Tsuchiya Yuto wrote:
> 
> Ah, I see! Thank you. I feel I'm a stupid... I'll do so in v2.
> 

Not at all.

It's easy for me to not introduce bugs because I never write new code.
I just sit here all day obsessing about error handling.

regards,
dan carpenter

