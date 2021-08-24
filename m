Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407A93F5F4D
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237625AbhHXNhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:37:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55222 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237581AbhHXNhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:37:15 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OCax7k021196;
        Tue, 24 Aug 2021 13:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=J0vH9MAm8TIoHXG8Rs9vaGsxZbBA2oG55L4kqdp6uhw=;
 b=nVN9c2XTnzsRg7Jlv88EfafZBI859ftiqEmeRbMgkzvqzkTZWIg+UdO3Ry3cjKQPWefS
 /WUCBFnNUez4TTgyGQ38h0wtM7hf0QiBZWBcSg98W0DVr8o1MQGsiMEDHRctyJyC5RIx
 fZ5LsztUNtdIT5uMOjMaZ6m9PO+7g2QNPkO//hFGwV5rwIfJzk5ZgvaQMt1Y6muI3hjN
 kuGoCe8JhamvoN2bZnNhyV1dPlp/JMHLzR2WO3OGs1CgVE2eLVgc9YKS7qvPUxh0zuYu
 kB+sk7pmrvByBeioPlcaNPMG4bck7xJA1f980mOah9KAWSz9iAzk9opDoqgj7iIHVZi5 aw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=J0vH9MAm8TIoHXG8Rs9vaGsxZbBA2oG55L4kqdp6uhw=;
 b=P6rtGS2GA1/u8w+VZwrZ6/4vb+WzRDDbtSiZUC0vA+/+DygXAvzzRoe2cYjPGTzOnDS8
 xqxQFp5YQ11YbvsC4E8Z57Iq5zPIkcAHyJF5cgPM27NtVL/WInoTMJaq5mHXghv0VmNs
 qQ9RDONVKxbdg7U4GS7/HXemDuj6Q/SjlpwUKRlZlqqsFGJ/5aFnemyohcZEpgE96WYf
 nSRg+3nNh73Q22W3umIElcexZb3F4PzSZ4/eYgMBcLluKNGffY/062+dEjOqmHoelMP1
 7xhP8xsOW4DAIhy+NDlIzCEG2uGmXOy+1hKPAi24fiPNRDiwyl+QdmaEIMcXwncYcJAy qQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amwmv8mxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 13:36:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17ODVX1m076894;
        Tue, 24 Aug 2021 13:36:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40] (may be forged))
        by userp3030.oracle.com with ESMTP id 3ajpkxakjj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 13:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcVBVUsmTUJf/O7+rrnv9kx4vLLo0EKpC74neL7YRjXfYXZ1pG6FocB1dm62ErIQAOjCTFqxmibJMWo+RQcZUFLlhGKBAueYe5BU65iiiFf9Ppxz/lnmdGXGHBOkI/4pzezAmGsPp29kMhzdGRtnC7tf9PkH77mp8dwErzZKzNYPhX/zle/nU2hNJ5uH+teDC7/dspNL7laXA5jgveYgU52BguPmegXHe6uC1yM8OM+1QgoP5FVZ4O8Yc7gCEgHyiGX2Ku+n1fzsIUIK1U2alRXCtHZ1AagudniPdssHSyJOnnKC+2bAJHDgxkaL8thFERwWsDXZyqC9GktR8/m2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0vH9MAm8TIoHXG8Rs9vaGsxZbBA2oG55L4kqdp6uhw=;
 b=Z9hk07EeKU6qGT+2cbrQA5VeKORMxRkbl7/rVTKj6kBtA7M2K7JA+jWEAE6kbwwJABHW59hlFbyO1uU5VYJgB8jKM6Bfg8WJpLLRNkrl8/qlNrvB8XMkm416CTZWAwpN0Rr78bKTDCCIXVBbwkMBR/MhrOJDBPp+WE1KqYDzwkD3oBKPeVb6ISYf3sKcnWJdm3BIJZjKYQWNDAiNe4OrxI+ORuty0GedPxu+9uD5OlaMVkmsINmIRkRJRR9qj/AkQVS1l8ivUJu2VyhZQQYQ/5E2bp/kV2pvoqzx4/0hccx+QOdrmPcHmbpKf6InQdnU3MbbiXaUXIvf+CdMIH8Kww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0vH9MAm8TIoHXG8Rs9vaGsxZbBA2oG55L4kqdp6uhw=;
 b=roM3AxyBYliJpJ7UjBLcyXm8q4dtzk8BO7Yp2VwElfa0KhSv0CWDKLlEmEVYTtM2UFIv73whkh/EeNDJMzzH2vtABLz+9LGST968DI8R6tMsJg+GQO80VMj86IFFXopprCpLt/36A6obIrxOO9RH0Z27QcdQmmOcsnmY99FAQLg=
Authentication-Results: pathpartnertech.com; dkim=none (message not signed)
 header.d=none;pathpartnertech.com; dmarc=none action=none
 header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2053.namprd10.prod.outlook.com
 (2603:10b6:910:3f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 13:36:20 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a%2]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 13:36:20 +0000
Date:   Tue, 24 Aug 2021 16:36:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sidraya.bj@pathpartnertech.com
Cc:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
        praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 00/30] TI Video Decoder driver upstreaming to v5.14-rc6
 kernel
Message-ID: <20210824133600.GP1931@kadam>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Tue, 24 Aug 2021 13:36:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7740f9f-58b8-4e11-d406-08d9670427ea
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1001MB205323018277F0FD06B756068EC59@CY4PR1001MB2053.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BE7CXCuYe1TgOnjS3jC4ImlEb9uvMmzuSLZvzwF68EDkH3UEjFDAnDVFz5RwvIe6RqKaoGHIWmD4u39f8abxOl0QtIZEGKkcYMlMHreU+I1d2T0MCNfCNTulUnkNUvvXCGPak1ltLP6Uoe5g1iY874HhoeQ0h2k1YbIQzfSsm7It2kfTO5jzMPlQh1xY4IHqSLGoA42YcFeP+e9i5bmd9rYT3lO1higgU9z6xQczlzBsy8gq2tzvePHrHZqtUgniTDEkIQWjIaDfSdxVvuHf+Yz6FqksZWeG8d3EbXqr2d9NweH4570xMikmhPPjj8kjxIR01CjPaQNUXCxpapDneKcDyHN6i91Muy1B0ifz5tPFXQ9dbfMi5DnZsaGxPvAScy1+hLchNS6xLQgaKewodw37oWFJZDjMK8gsF+bkL0hg8vlgbeSiM83cQ8PtPNtA91MtCA23WpzeQbIFhxNe6273Q5dzT67bkcg2AEObAiJPuerALYYqq94kBMco43NygJuCN78yszz3BPiLCA34SfmEL5zlRML5G+3u+qhxFC6VjqT6xLX4RgDnJQhFAx7UOCOyMkDNlBjn5Hw8Hs1+WdwfBTK+UzoQkOBWf8vELHlkjMXZeoHJc0b12Z+5CltuosdpbtyBBTQEvQh8Ni0d3U/mjm6s/dz2wM3h6tzRr69CbYEb3WWfcZ33AUxO+cxXh+8tpnteOuXpU8nNIxTVwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(8676002)(4326008)(186003)(38350700002)(9686003)(55016002)(38100700002)(1076003)(4744005)(6666004)(478600001)(2906002)(83380400001)(6496006)(6916009)(33716001)(44832011)(52116002)(66476007)(5660300002)(9576002)(66556008)(8936002)(26005)(956004)(33656002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wb5LbYDE82PRWryCkdGfFcJe7cEJ5NP8bOig3AkbEvlviwThhFwBP5kY2cjI?=
 =?us-ascii?Q?sDt1rZhDXBjq7DYwREUxoK5ZL/Edbl119wAlgWE7ckoXTc/o/wuNftBF/ZMm?=
 =?us-ascii?Q?yFv4rusamRdOCPkahYOqw2h1iC50w6hK3bI8rMPYdJ6ty9EYOvb9abrxrJs6?=
 =?us-ascii?Q?2I7AQqOV/OL24If1j9hD+UDSsHxYfl/ConEpKYqn0UiBHNCnmYaB/5o4SOsO?=
 =?us-ascii?Q?5D7FpeNWq/r9uwdnkGUplNJi40GHP8YGqecjYC3ONPjDjXZcIaANh7+9waAs?=
 =?us-ascii?Q?it2nCdJrPMTUhRx5OBK528jighhh1tK20Vx2x41o7lrl5VVXzwOF37XVKiqZ?=
 =?us-ascii?Q?mQU3KDkVFMnUS91cnYc/x6jeE7VKE/+GksXVNDGvfotfZBUl1/ZDlqtozqZB?=
 =?us-ascii?Q?DMAqoVqybt++dzY/FsqgX6imtgJv77WNg4wvN1JaBKOY9vaJOL6/C6vRQK1+?=
 =?us-ascii?Q?v+Up2X5MrmUGbb7VikdycCp1gQl9tHoeE70wF0qwIlEsjizQi+pYfLNTKXUQ?=
 =?us-ascii?Q?/F8+1HLJbmQ0B/LtX1TpeXuWnr6fesnStG+UFcxX1SuraplnPl6/nzjTh0+H?=
 =?us-ascii?Q?DiWbWmjD62Kb6pDV1OOBgsMFHXlUYPqtUp5wbx8HJlKFSa7VomUTkJalvF97?=
 =?us-ascii?Q?cfOFrhys6mPZDlpDLC4uj8KhwMVDpahx6RNaZ5gI4bNbqdP22KC8b1FOOE5p?=
 =?us-ascii?Q?+S42UbTIOL70VgvY/DAvUZ3SBpMpInq528Lp+PYALvMqwZySFPTELXA3Uns7?=
 =?us-ascii?Q?9SNWgQVnM4p+VrerRbLacbJokEXyu9u4lwHm9vw9UrFT/Z4tntJTf6mfZdU5?=
 =?us-ascii?Q?zFHKz55OppDpxtD/Ety0vNC5hMZv/nvt2Ms/qrh9tY0oTSc9F5qrBRjJRlUG?=
 =?us-ascii?Q?pCrRh3ZVtGhmNr3YNV9urnfTe+qG5/HVoOGkS9xPBdm3zMeFoOgGL1L1eXvL?=
 =?us-ascii?Q?8oAbYU0cJFB/QBOgCf6ENOT+CFZb1Z4b1EyO0RaU2Foj7zwaxUytPHvVrDaG?=
 =?us-ascii?Q?CIf5xenRAnHI58oIpBImT++1S2EMwJ7vWzhhhuLbgVhZBYAURsO10ZzRwyA1?=
 =?us-ascii?Q?JFt2Jf3y2hLRlglvKf/PWnCkuBwoayGnt++QSvEMMjUrEJvrIqxO95Y452iT?=
 =?us-ascii?Q?Xr9BK/pnpbR5l7MpcAagc+eMgD8ROneuxeywhIh6EG6tFX+ZEyicAnk4nS3Y?=
 =?us-ascii?Q?pFxi0RxvYROOpqF4L/eiQCYWUJqe4zrkMOSmZmIKYOL5bbgCKJAHCHa4fjuO?=
 =?us-ascii?Q?krfZkYidqIdCY7kEX1WMsZ0Ak22E7DqtaObrgMHh4wm5beLEgpISNA3d4POa?=
 =?us-ascii?Q?8U6F9M93hLgybCiItc7GEZ9q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7740f9f-58b8-4e11-d406-08d9670427ea
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:36:20.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPlArMN/ZD4ZpuktP69v6BYdnevLqOWrtqnJ/CtxwP4vqfyUotpdkIXacdejy2nlz8kyzRu02mL7SfaLyNk9pKUrTl5+0nkhW+CPYtPvwcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2053
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240090
X-Proofpoint-GUID: Wo8833HOcezvouBenO32i-odOoAudmDp
X-Proofpoint-ORIG-GUID: Wo8833HOcezvouBenO32i-odOoAudmDp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 07:40:07PM +0530, sidraya.bj@pathpartnertech.com wrote:
> 
> This
> message contains confidential information and is intended only 
> for the
> individual(s) named. If you are not the intended
> recipient, you are 
> notified that disclosing, copying, distributing or taking any
> action in 
> reliance on the contents of this mail and attached file/s is strictly
> prohibited. Please notify the
> sender immediately and delete this e-mail 
> from your system. E-mail transmission
> cannot be guaranteed to be secured or 
> error-free as information could be
> intercepted, corrupted, lost, destroyed, 
> arrive late or incomplete, or contain
> viruses. The sender therefore does 
> not accept liability for any errors or
> omissions in the contents of this 
> message, which arise as a result of e-mail
> transmission.

You can't have this type of footer on your email for GPL source code. :P

regards,
dan carpenter

