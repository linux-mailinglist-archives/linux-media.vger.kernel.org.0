Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0A04207D8
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 11:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhJDJHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 05:07:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39000 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230418AbhJDJHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Oct 2021 05:07:51 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1947o0iL025114;
        Mon, 4 Oct 2021 09:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=p4ERYWfCH+DJtEREdeOnn9P0BuvR8RRSwvVmtF9Aa6M=;
 b=jTT3/VH7WcK2GQ8/lS554rTW1dsZugzoSwpmGNM4TZQ+S6nEb0Y3D55TQ5eqqfw2YKco
 hzgw7uMDTc4DsuQ53pjPxU09wwwLdQSLFIzkG9kDGoyoib/7IPuO9S/t7AmSs8Oyxwse
 a0W96wwo1va+V7wmSKunKxZeT+DHkbV6YvT6kO19mjm6SKJnu7AFY5Mf1oLBeoE6z756
 +FtnXlgjjag2n45axboKJgzGqXTak+ZFVpfbglLuBpH9sVTMXabOabq8qpzXXB5whBBg
 Jz8WueM+5ZyMHyhdDuaPKFzSljKBRXWo7GDYAd+A/b5DKWHKjCom35T7SI1cN/7H4RKa XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfabhttnb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 09:05:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19494dre172667;
        Mon, 4 Oct 2021 09:05:44 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
        by userp3020.oracle.com with ESMTP id 3bf16r4be8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 09:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt4bs9d51PGvjz6Ut+DMDfx5QA0T/7WBlC/5JJb8OaYUx753xeIxRjnV/tLikwfp163F+v5TZOZfj/sV1n8ymYazMpifeSE0o9KR4po5VdmLnSLuLZ9zsXW8ViE1M5a98if9TIUKfnKj4RJKjdjdFNsGSl7/bU2MZp/+CAdlDj4RDb0qF4z8VHXbkDc3MY8G0d2rFofIACMUlh4vsjZnDv9GX7xTI9ZpBNdkp7TA06S4UrnmtlJ0AJZdN4iAfDK+A673iDsFVTcXoI6tpj2QGJ4Po6VdzIlY2NIxlCHx7+V9w+AkxdZU2mXMCkKlX61mpYGy5Ylni8/2iznzZijk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4ERYWfCH+DJtEREdeOnn9P0BuvR8RRSwvVmtF9Aa6M=;
 b=Y0SFs3G3jbmBzOSE2GlXe/sERZVrpc+lzaT/E6u4sshy3LXZpfyzx8UDNSEFjyk0acNYMNOnMLCTNvWlEMB/uzVxPTsZa78VWQOGttemHeNwU8hw/SLp0Ha/xaAY4cQdt28p8PUt5c/H+1KgnwN4gDghA3M0YBm83FKjWzPcrbiODqX5Urdk5ObEV2mllbIXuTyVTfNuMB+7l7MBWKsN1JDf69aSoXo1dKNsbd3szbhyw40/4iV9f1ygnhYaYht+tVrW3NpTbpP4yOZ+/JPL1klV/45YkfV/uN+HxzqaK0uESKT9mQwkBPt2Zu4r5+QUJZTiqzHmknGJP/Ab5vWSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4ERYWfCH+DJtEREdeOnn9P0BuvR8RRSwvVmtF9Aa6M=;
 b=vJdTBnfmxLr8CYvDbS9ghuwTUZMj/Mi0NhUa9udCH6jjONJm44XfEjct4u2fOKs2HRG3xKSde8AKwALvqOLWfFeWuPRC8aLeCPcO2UGs3238OLFMg626GJrXP0MutG+ZGZ//thBXL4aIBsBCIePY3wI7DaE0ECu0++KIt4NhSUo=
Authentication-Results: students.amikom.ac.id; dkim=none (message not signed)
 header.d=none;students.amikom.ac.id; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4547.namprd10.prod.outlook.com
 (2603:10b6:303:96::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 09:05:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 09:05:42 +0000
Date:   Mon, 4 Oct 2021 12:05:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ammar Faizi <ammar.faizi@students.amikom.ac.id>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bedirhan KURT <windowz414@gnuweeb.org>
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
Message-ID: <20211004090524.GS2048@kadam>
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Mon, 4 Oct 2021 09:05:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c533d4e3-9597-4841-d8c6-08d987162415
X-MS-TrafficTypeDiagnostic: CO1PR10MB4547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45474AD3DD019B660DF465AB8EAE9@CO1PR10MB4547.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUkcy6CcCBvZuc0TRxeOEexVKsxiE7Bi/u+4c5FBUsHYbQ/kLy7+9f/V7HhA8zLy+DB7IrU3fDsw0j/K5xQ+UuMf+Wo+ES2IrQeRYm4EmrTkjsKcC2Lgwhi2Ky8OI4yNZWX9gsBaLTOUkFvqlLDf3ncrX28Bk5JnD9C7wvu+nhbplXcf/ivlC/nFsuWp8jBR4q9S4ywQ2Me1WgAkRsmavFWFRKEnl90xbCGe0HLvurDcyA7b3XrPATAs45E32C8UaGsmqc6CCbLZNbUa21tVP8rpDddWyemrWEwVkAY8hD9Bpwq863BN8PrHUAHRuc+zOU0pdjMdE0KFrYsSitEvgunSgoGSBL0jdKwetpQZqrAL4hZt3vuksUYeVxeSbuGdqcS9JNI/8LuYeP0mydgd45a6zQ6xQjP6V+TPlsaC7DbHJqzpS+ta6tiITQCdoDFpqHrWv0bg7Uy44I5vnmaVMpk1zGlsJr/1zqN54/kAaow4mJEhHpSR/gICbGc9+qWt+bSTHTaQkyzGqhRVgWWPftCl+pl9jdHWUU/sguSp35I8ILQfDbmWONvgXlq/Q62272uC/HD7fX7pzLB/6UHM7zEy4ZOGEGqwgpDqLzySAisc0jnNrsctk46s1hzTSdTIQ6VKUoZZ7HYy9PK3dMtP88/+CmK076XCdohyRdmmszvrBmyyiSdXZrRw7IZGTYjybd86eQYubDbFKCOI5Bbw5ZhhpQmnaN1Xyv8uF59ZIgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6496006)(55016002)(9686003)(83380400001)(38350700002)(508600001)(5660300002)(38100700002)(186003)(33656002)(52116002)(86362001)(4326008)(54906003)(44832011)(2906002)(66946007)(33716001)(26005)(6666004)(8936002)(66476007)(316002)(66556008)(956004)(6916009)(1076003)(9576002)(8676002)(81973001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBFOXlYeWNwMnFrblJDSU8wSS9yY1VoREZ0WHZ4dGdpTmEwbHNJdmFQZWRy?=
 =?utf-8?B?SStWNTJsK202a2Z3bmN1M0ZaMHRhTnZRT2dDR1RpcDVXZVVEMUo5T3NqbllZ?=
 =?utf-8?B?UnA2bWlmUG04aCt6MGYrTG5GcGFEMDBZQm1KQ1ZWSHk1eWMwSFBSYWw5SHFP?=
 =?utf-8?B?K0xFeGxObjMzREdsRnN5Q1RxaFg2d1hxZ2lTMFpJM25DU0E2K2pMR2FWanEy?=
 =?utf-8?B?QTZ3NDZhb2YxbHlNTExTb3MzQjRQaitwTDdzc0M0RDNVOUt4NCtjTGNjTXNv?=
 =?utf-8?B?Q0doK0NWZ3ZycXNwUDZoclF6V2lxOTFndjd6YTl6REFEbjlncUg4NlhRYTdk?=
 =?utf-8?B?TkpNU1VRWFNuZXpEY2JleTJHeGM4NzNLOTBTbzR5bWN4QXAxZFE4bFFsTjhD?=
 =?utf-8?B?dWJzV3QxTU5SN3d0S2pOanVta3JQUE9weSs1bWcxbGd5RXYzcE1wcnFZVGww?=
 =?utf-8?B?Z3lQWUttclhZY1lOQi9KeHRFUGpsMmxlcll0YVNmYk9KN1p6L1NqOWNXbTVt?=
 =?utf-8?B?SXYxTDhhdUdvZWpuT0xNS1FUbWp3Z0s1cnFBb1BxaDZISlMzQWFzT2VNeFZv?=
 =?utf-8?B?VTllVXI5d0J3V08xdUdMYnE2bWR5SEdXdEFsR1dqQjZOSW1uWWVLOWdhNkRQ?=
 =?utf-8?B?VTI5bkNKQTMzSnR2dmZ4blk5SU1aOTNUTmtMdHd6U2hibTZLNlV3ekxHTDNi?=
 =?utf-8?B?R3Y4ZmpsVk50M0ZqN05WSGY5dkVNYjlyYnVPdHFrSUZzbW93OEhQZm11Rzhw?=
 =?utf-8?B?VFg2eTBOYUNKSjZTSkc3SDdXcU1pZEI0MlFUVTFuMFVPeE4xb3gzQnBmcFRz?=
 =?utf-8?B?eE93bHd3RStUdXF0VmlLNnh2V3luRDJFQ1J6MjhuTUhkVUVEODFSTGRjRGRH?=
 =?utf-8?B?dVJ5a0tTQ0tjeFRKNjdackx0MmZZYmk1VXNJdGtvcVIwd2hXdzRQQ3ZiczZG?=
 =?utf-8?B?RzJjVUhUMllmK1FxYTZXTUhIWE9sUm1TOGNnUVgrc3VkNWwreEo5aVIzWThz?=
 =?utf-8?B?QVROcnQ0bUE4aUo5MkxBU2NQU25YVldEY1B1bzlzdnlsaW9zZldwVzJjczF1?=
 =?utf-8?B?MkFKd1I3QnFrT3hZc0xIaGh5SllZRjV4WlFZc1JOUjZFSldsRVRDVU9ETHRw?=
 =?utf-8?B?NWkraW9tWXRxb1BDTXhCNVg3U2YvbDAxQk45TzZyTUJ0bWl2SERvS2FpdkFV?=
 =?utf-8?B?dk9OT204Q3JHUms3SWVJVHp1QUlIQ2QvRDBMYXR6NmhSWUM5clBLenhKNGFB?=
 =?utf-8?B?QlUwQklVQjEwSjFMNkpDeTM2Wlk2QmpwQmM0TlE3VEdmR2p5eVZuSFhpZEl6?=
 =?utf-8?B?WlNNMGRkR2NJelE2Sy83Zk5FRldlcGwvUzFzSlBhMm1GSTZ6NldJLy9BaXhk?=
 =?utf-8?B?YlVaVS8yTWR4QXFTUGtwZmxEOW9pSFpXaFdXOVA0T3JId1B3OGFqcUFkNkdH?=
 =?utf-8?B?QTVCNGx4RW84T0p0UW10RHU1S2RXTnJYVmptL1hZSnF4dWpMRXIwc3pyRXF4?=
 =?utf-8?B?MHRYUHdVbWdheVlQelkvMmVOekkwYmRIcE45YWgya1hwQXNuMGRHZk1BTXBO?=
 =?utf-8?B?V2lVeU40Nnh6cFVab0NyRU9PdHNKWVoyREFYMU1oUVZjay9Ybjl1MnRaR3lq?=
 =?utf-8?B?dG1QS214WFNPd1BQalpOSmRHc0tIdEFFNXZHZnF0NDkrQnYvYU5ZTFRnSFZu?=
 =?utf-8?B?MlVoMURWRzBwUHZjRFlvNFlEM3ZoZzVaQmZZYVI3eWlrVjBaaHFKZG1kVmZk?=
 =?utf-8?Q?VqnRGdjapJrqhcWuX2drSh449SQbBwY1j/UXbfi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c533d4e3-9597-4841-d8c6-08d987162415
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 09:05:41.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZueWW6y372k2SoH6fILJjXTsPPk2aOFzNoITbojBlpHK4+xqgzGWlouzRvwIPeGH96ijqvcc39D6YxZ40U32w3tZaU+yx94jlXmJDDuYKag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040063
X-Proofpoint-GUID: o7sKt3S-0OpeqIDWePpb1kG0Od2PiKhG
X-Proofpoint-ORIG-GUID: o7sKt3S-0OpeqIDWePpb1kG0Od2PiKhG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 03, 2021 at 06:17:23AM +0700, Ammar Faizi wrote:
> Bedirhan reported build error:
> ```
>   drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
>   drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>    1649 | }
>         | ^
>   cc1: some warnings being treated as errors
>   make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
>   make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomisp] Error 2
>   make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Error 2
>   make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
>   make: *** [Makefile:1868: drivers] Error 2
> ```
> 
> Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
> remove useless returns") incorrectly removed a required return results
> in the above build error. Reinstate it.
> 
> Cc: Pavel Skripkin <paskripkin@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
> Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remove useless returns")
> Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>

What's going on with this?  It's like the seventh time people have sent
a fix for it?  Why are you not using against a current tree?

regards,
dan carpenter

