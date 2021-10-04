Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35B94211A9
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 16:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbhJDOn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 10:43:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12266 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234703AbhJDOny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Oct 2021 10:43:54 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194EVThb010779;
        Mon, 4 Oct 2021 14:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Ebe40H8Am6z6kw1XDVPLwGdbz/wG91/aajsqrTAiFSM=;
 b=pbHlvwNW3H+b+yWS9tarVQNqpFJxVF70W71qI63060ZkP3vRN10HBnZdjGeuq0IQEtRc
 YnG0mH4YeO94dFBXUz1HlISiFRPWQhGQmZeH8aoM1tZklLF6RriBFelU98tQHyolRYzW
 BL02csdsjD9ZcLTt5dcW/gkovoXOkTscpD1HodWVDUD1RdwdqYMM3l0SRiQgcrjmdPP4
 25ovJ9JmQBa08tt5uMgrlEQxysCdztZ3iKcGIcX1AnqfaVs/kfexJAW/k5QTCSoIUSqX
 FQKOQk5q49cPKuvGyXhchv/qyfxxRweKPn3bu8Avi5ei463N7a+yZ05ZSQeclssujqA1 hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfaskvtfk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 14:41:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194EZrsi097710;
        Mon, 4 Oct 2021 14:41:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        by aserp3030.oracle.com with ESMTP id 3bev7rrpe9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 14:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1SPQd3aKMc7z7FROpgjXZbOiFBCd/L/22dB1zR5YKFdpFQyxhFDzu7eDPOGkuUvToNNsmPRN55ZoGOwnrX89UcqHJviySy8MCRvNV54JqhUoL9raivT+QTK1tz2Gfp36ZchxC0tGWAkXg+ZGQVR17YNoW8lasy/S9vHnoS/8HxMovgh2KOvKDnGsPvSRc5uUS051ljb/jfA7jEIqq0+0viA1nBNnI1rMMbT4NKyUp2dvRBXmfJ9cfAMq5b/iHXAkJi8V+mSLoglGdckHumSNZ0U/cdAbfmKNlvH376tJ/dYuV81uVMK/jIq2GHtO7nO25ytn1cqs17TrDEV/9UL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebe40H8Am6z6kw1XDVPLwGdbz/wG91/aajsqrTAiFSM=;
 b=I45ujF31Sr1hb7p9TXz6yqM4jOW6Cm5Nq15O6+yJKI5W6GU0XFc150GtGWPVRiFgIGLYdrgdEcCCdJ+tKEnijulyrBhQ6Wyt2os4flOzqZzR0WRX8LAamFPmj3kVqu09nhmWi6Z2Cr5P3yipMjMgi+F9tVcChG7dvTTRAtZ02XQrlpt35FwvlgVNu599Mh6YVqVwBuQQlYVjr1AAAeXDKx5VOTtjKao2RlvgbPGQHpcnDdTFhtXh36X9DADtUmcZm4/ugPzY/HmdGIkTEvRA3bHhUXxwV8BuqPmQxvgjK0AexMH7oGk7uL7xYDaeSXfFaG5pvuHhqm7nxMO+Oy9nWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebe40H8Am6z6kw1XDVPLwGdbz/wG91/aajsqrTAiFSM=;
 b=P+8CuRKQWxCxEUBgnNTAdE/Mk740Qn2Qihvch40k9W+zQDoIYI46kwNjvx0xUSepTvAHYHAH3e97yaVm5iTjIgtB3nETCZ4cXTrLfWbk9StD0ZSaQXLkpCzLrMgjM4rgoAAGhXH9jCMZuPPmhX6C7tFLzddoHJiHzOiLHmMarOk=
Authentication-Results: students.amikom.ac.id; dkim=none (message not signed)
 header.d=none;students.amikom.ac.id; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5412.namprd10.prod.outlook.com
 (2603:10b6:303:13c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 14:41:53 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 14:41:52 +0000
Date:   Mon, 4 Oct 2021 17:41:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ammar Faizi <ammar.faizi@students.amikom.ac.id>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bedirhan KURT <windowz414@gnuweeb.org>
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
Message-ID: <20211004144133.GE2083@kadam>
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
 <20211004090524.GS2048@kadam>
 <CAGzmLMVMmzcP3ih33QhxOBbiqBZRgfiz6ke5K6UMcSeope8Jag@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGzmLMVMmzcP3ih33QhxOBbiqBZRgfiz6ke5K6UMcSeope8Jag@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNXP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Mon, 4 Oct 2021 14:41:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe07d80e-bf05-4cd5-945f-08d987451b10
X-MS-TrafficTypeDiagnostic: CO6PR10MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB541255C9206A1E3722DD44EC8EAE9@CO6PR10MB5412.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DilEfRBhxQPIzlCd8Jj2P0SAyur7J2RS2s/tqob8BHHZEV7ik22/xEsh6RHdTMC/cLrsSqVM4snipURR3KkiD1NqjFqrtBcQqi5AxKiR4x9cPn9y12ar/znRf83APDJSC9bfcSva57CZntllVEKBmmDc6iGKBWYuO93QJhlBtBLKqH72RDnqS6XfSc7o/k+5X2/82lLcgjOIpnXDJuBDMBs/gsM+9DaEVYsv9rVYuw4R/SpKK4BwFtHxfTAl1UnMRswsfJZmUzV+Zi6blAO50a5zzk+a1jp+dQV53IpVtr+ObuXgdvJ9gJ1va+5xRrO3VKw65DGSQVxocBuMnyZ3r3ZJHplgL9ZBNYpZ2aq4phRt8puSFivhrFvjeoO8TJbwA/SlvVaXRdAWUgAxv/n72gx+fLGdscgyS9zW2dP/3/8vXcTfOOLUJp6UZ78bKWCBEKLJGXaRm8Ed233Sb1X1hZtO0WhT3vC+hMdu/WKOKG3ft/o3fY90fwByeE/IY2mgODLQaVzy3Nrkam10wcVTYPivbxDYBIrBC31kq9CsZpjwLR1Dx6CSbEVnXxNjNdHHZQv9/sXGnsHT2+MFQlYe/k0+INGr8kKcbK06fQ0lM2uf0LoQnkuHWvYVEBOwXMhyXCf9kg984sIBNVRKpLW8FBaBx4wu2q+pMWFzy2ztLRTP+SzrxnDU2AD2X6YLwVFlWL2D2ufUHLVVvv3jnep8x3JYuSHphyiCUVQlgaPg3YQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6496006)(83380400001)(508600001)(6666004)(956004)(54906003)(5660300002)(86362001)(4326008)(33656002)(1076003)(52116002)(4744005)(316002)(2906002)(44832011)(66556008)(9686003)(38350700002)(8936002)(186003)(66476007)(66946007)(26005)(9576002)(55016002)(33716001)(8676002)(38100700002)(110136005)(81973001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4BWKBUYL6quffqvKX16i86t4+ZN61w/qhDCkrseKwFMON7g+2K03cc25C6aq?=
 =?us-ascii?Q?BR9Q9m2WpxwAc1OHwEJAESk+lTquX9x/yFV1totoQHofnG26jZ75jDQQDcHc?=
 =?us-ascii?Q?kx36Mm6vte2rSNuEv+Fu/e+Uvh62wLfPvet8gJOTgZuCU6G5tVcNfwQIW4HN?=
 =?us-ascii?Q?gtmsqxYoxYlu/RlpqI2FiV68lgFR/JxXZkhiT/xwmWYg8isx0wsNFlli0Uxk?=
 =?us-ascii?Q?jNIMTUPEpmwKV7bEEyhlffp4qeZX1PpsRT46neymGFUiH/h4Z9HytJt+Rf6e?=
 =?us-ascii?Q?QbVRlIYLazUpg2s8ZyALMBTLx5aW2BoBiU0YV1THScv44hzjmNtM1lw7M6ug?=
 =?us-ascii?Q?5QHK2vXcQf0rbHBb+hrev062fko6yqpeLEmaxhWKYxpORHXcezQc2PSmddSV?=
 =?us-ascii?Q?LA+XsuxMua2CSTEX2HpRuk2A1lMofeMzXQxm023DvOMzwfWqzV3NqBxObNMu?=
 =?us-ascii?Q?Of3xD+HBmZBBWgsxos+q6C3vo27GyN83nAsQ4z607SeOEierSGrX4/28SDQF?=
 =?us-ascii?Q?Tyu59LI0eKFvLBvELpgNfUtmVNutTWom/qtcNkDb0d00silyeQjk3dyR+jiV?=
 =?us-ascii?Q?+MtWsBMU1IUE4HOj1MNKnEOsEYZCHsKpnJjKeChjFS9JwMOyhptnLKP0wIS7?=
 =?us-ascii?Q?pGXHNZ7s0oQXVeTP4tdvSTzDeEERWVdyYc/M4/KHgdhBDK6m1DFBW8DZn5xn?=
 =?us-ascii?Q?/cSV7OZ5LM5eauuxZCC1omcnhTobu78rTb1y7oucG08tWgmIjQS02PNRhl/g?=
 =?us-ascii?Q?jCizylkVed1QAB6DRJavLQ0/xwkJqV4RsvenlDrdGaRLEvFdbf280rMgbYB1?=
 =?us-ascii?Q?8iY9AbPlFZC7+HooMG2sLtuelOgm/OZ3qgWjrxRLgsB7Ccjfnyjvbyc1wF2W?=
 =?us-ascii?Q?sXijtDGWSQoB8wnhy0CMB1vnMoc4Ii94FY6V4enNn8fQ4fRcSHmnm9ua9sxi?=
 =?us-ascii?Q?TiKRNPPatnetbcYZtNamLHTlziiOIkgXkts9rxfoe2WTmIKro2NZrr/Av0Iy?=
 =?us-ascii?Q?2pvESztJB0axVI5TvDnKG7+fASeGbmgC8A7NB4Oc3ymNiyDzwXQsx4lxvWlU?=
 =?us-ascii?Q?6OoWb1TgXdMlOhWCd4FAvjZ8kNmN0E+vKBsAHsZFRDXoQLvvmeICThqfFZrl?=
 =?us-ascii?Q?FnFn6HZH9mXqZeWAPJpBfj9rLgXcA+hAqvzorp0OEBTDjLIOlooBl/xsbVGX?=
 =?us-ascii?Q?Znh6qw6cU2r2bvDmEEqNlVcGbGbeVxo9ExVwTsojSsnz0cxcwkNyuubFfKJz?=
 =?us-ascii?Q?B/sa296eCxBRn1Z4ABsYXEFt9QEMFzlQAYEELrrW9qZlzMmZyNeCTxJUs2hM?=
 =?us-ascii?Q?KH1+LxWjPCrMuEYp2xUd9euA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe07d80e-bf05-4cd5-945f-08d987451b10
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 14:41:52.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze3v01Xx7ih+mh6yj/zc0Ayf5ndpnspN0Nl85NRNjdyzXEf7zV5oJtO0wVOL8D1yfaanVLSeNngESLPm+iCGD1XCqa+M928GpsRuPFb2fQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5412
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=932 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040100
X-Proofpoint-ORIG-GUID: LVlTUVjLdo3xmzesbcXuKIIciOu9XqZp
X-Proofpoint-GUID: LVlTUVjLdo3xmzesbcXuKIIciOu9XqZp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 04, 2021 at 09:11:00PM +0700, Ammar Faizi wrote:
> 
> Sorry for the duplicate. It broke my build. I am using Linus' tree
> 5.15-rc4, the error still lives here. My mistake, I didn't check the
> linux-next tree before sending this fix.

Mauro,

Can you please send commit bbe54b1a75a3 ("media: atomisp: restore
missing 'return' statement") to Linus for v5.15.  Otherwise we're in
for a world of hurt...

regards,
dan carpenter

