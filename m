Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C0552E488
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 07:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345651AbiETFw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 May 2022 01:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345649AbiETFwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 May 2022 01:52:22 -0400
X-Greylist: delayed 4754 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 May 2022 22:52:17 PDT
Received: from CN01-SHA-obe.outbound.protection.partner.outlook.cn (mail-shahn0097.outbound.protection.partner.outlook.cn [42.159.164.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64819C1EFC;
        Thu, 19 May 2022 22:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX4UnTXi8sRPaIS5JqMekK15TFuEpVcgZ5bqHTdFbOc+ilpNNCIZ1NIUSjf2eymHa8fLCYRGYmAE8QJ15oLDWnHIeSrW/Nb1jsJaQVlo/kgKURGhtvLtGRqvQ3EcZWuMsbWvyN44lSBJ+g0VLS9PTr4s2O483w4RJisQ06AwmFklaZnZH2S1Sv4+LgBx+YqCKRjGuoqHsIuYv3V/zgYnsEhysAIUo/yv5WUhtsvNQgyUXU3Vyd5jwN2A4WAqy6Ys4fDXGzA840RorAn49yuf+NWpHXskgTNTH6C0lp/19cGgnk9NlWTEXa4RcB4UzOkSyjzvteXrRtU23NteFaCRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHa7Vpxtm/u3S4otqoZTmpXUuVJNGmaT4A6UJUMDuKo=;
 b=DRwHzouMHJQX+Wau6tf8vC5A5jxLAxOavAyuukUMgnG9zJC+Bwr32gVpF6q9r6ZH31aDyFL9CAZA3Sg3m1DMnLVbxnR75WW3I2eTKsySdZ/ppcV2Hmytqadqz1QeagRQZmUGyTBOSR0a/ks+ABQ3Am7kaLoXi1UKLtOXGwwwO9GBMl103TXITNbmSmmd2utSAbzIlzoa8X8b5zqYlRAKOhW7Zj7nErbHtNcofpQO+h2rIEGlh3IWHqYKcNLgHCVFGcL8p1TzWOpuHmQ59wowx8AYe5CtEZCD3TzEeM/asM9dOAaFC/XMW7qvzzhPliWZkdg1RU7Y73eGFBoOJCQS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gientech.com; dmarc=pass action=none header.from=gientech.com;
 dkim=pass header.d=gientech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gientech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHa7Vpxtm/u3S4otqoZTmpXUuVJNGmaT4A6UJUMDuKo=;
 b=vzBiclE5ophprcwR2331A/u/jsRArUK2caAu2QmwaGSShxVHosg+ZrPe8zZ56kEzzr/rwKZriAW7Y+Dqpq/vq3Xadai61ajkctcjmgWEtOOrghDi4vbSfQUpznsItcwAKJLkU3cfadFRG7jyA9BAJD2SjJFX/yudZBxTGlZisLUlMFPP4YEfZkExt1PqX6zh51jd6j3yG9nVaHd+ATh8fGPk5W4BgO/mpnGEOJBIBpHWQfxmKbps4Tengger3Es2ezXleFNKR5GteYRwiIn9OsJhYd79sLLgcFv0+Ctl+1xVi2+EKo0pNlvzHDYaRZr23LnNUg7VujPiT6ko1mDtTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gientech.com;
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn (10.43.110.19) by
 SHXPR01MB0877.CHNPR01.prod.partner.outlook.cn (10.43.109.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Fri, 20 May 2022 04:18:30 +0000
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19])
 by SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19]) with mapi
 id 15.20.5273.017; Fri, 20 May 2022 04:18:30 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Ree
To:     Recipients <cuidong.liu@gientech.com>
From:   "J Wu" <cuidong.liu@gientech.com>
Date:   Wed, 18 May 2022 21:19:10 +0000
Reply-To: contact@jimmywu.online
X-ClientProxiedBy: BJSPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (10.43.34.163) To SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn
 (10.43.110.19)
Message-ID: <SHXPR01MB0623BF122EDC6B68AD5F893189D19@SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223188e6-8e06-4dce-f958-08da39141aa1
X-MS-TrafficTypeDiagnostic: SHXPR01MB0877:EE_
X-Microsoft-Antispam-PRVS: <SHXPR01MB0877ABA187963398D693EA8189D39@SHXPR01MB0877.CHNPR01.prod.partner.outlook.cn>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?m38naA0wN8tdg4CorXN3v1YimLjiqvDqMqCp9Zv9jdEdJCRqs8XxJIQkoO?=
 =?iso-8859-1?Q?aPM1jMKXGSYfZPtJLmP7AqZnYgraH7qLWJfMwn1EY6WcG0rGrTZFsPcA7z?=
 =?iso-8859-1?Q?xIp1WShI5woFVWAEMHstuLBx/uaaBJ6IPqTTWWVuI3QUjIZ4fn3ThPsE5a?=
 =?iso-8859-1?Q?A5klon/RaimKeX/ELx71tJUHWXuJ666bDNJGrQ60FdA8dqp1IbmXXyjkI6?=
 =?iso-8859-1?Q?2AdjcXpw8+mbsUWWI/aa7ygoOkU6/kSxQh9yQHt2gEF0pm3+h9Iq+X8KSO?=
 =?iso-8859-1?Q?mm8vXu7Wz3pCEbT4gL9LckR3hIqjYUMZ/1kdCMR+ju1Fh9uFOObGp2E0b5?=
 =?iso-8859-1?Q?WmZS8hUCL2aeAZTydEmicrmaJJdDTPfHtniP2vyQ3d8tBsFOhVKz9Xmk1l?=
 =?iso-8859-1?Q?xhpI1OBzCrEldNTvoYRT7pugUkrCqRZyihYSSJJLboEO4wCzEc/dsThlxh?=
 =?iso-8859-1?Q?N/LUrpdch7PZq61RLIesN811uDAD0zTq6p6dALG6dUJ8V14gygdHdszzKi?=
 =?iso-8859-1?Q?qdGF4z872m9glnnlgAmOzC6LDV78EzW9kngGgCaTU96340evIC3cDBDCz9?=
 =?iso-8859-1?Q?ZxnVF7gRKbMZ0WJHLN+aG8QeNXQazGM5QSXMd0w5MwjjGGQisV4T4VUJwR?=
 =?iso-8859-1?Q?d2fyKIFIs0euOWsJCR75BimTaf4nH8SWpqvko+P1tr3IWtbwiI54ONwnOe?=
 =?iso-8859-1?Q?DKhGqvMKIWT9ufRxtrdvj1fg3r6cPhZjmDVbJtYyyw2JQD803kkOrH3vxj?=
 =?iso-8859-1?Q?1LdM0DAX3qSprhSNUAQWicPT/OD6xfz7eKZ3S8b2iSV/ZXPLZ6jxkZRTs6?=
 =?iso-8859-1?Q?hAMt9Dvb6piwQkBfUrkaCpfwuEpX7DBVgFCSy/YWmjMKqxm+NaH2GQwkgf?=
 =?iso-8859-1?Q?LUhr1s09laDI7r+Y6fwDgZxlW4PFhqrlWa1hba2Z89HT48VUQI45PdRYgt?=
 =?iso-8859-1?Q?x94SAwe6//GaE3r6UbRMaO01vwcyhzj+2oiSIUgk5PNNItQuLWBcz0TPfR?=
 =?iso-8859-1?Q?UOy1ZmbojOZdJJLhrpCiJIGVd2hCyQ5QnFGCIggoKrDTi4MuV9Te7E7gAs?=
 =?iso-8859-1?Q?ow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(19618925003)(6200100001)(33656002)(26005)(4270600006)(7116003)(38350700002)(38100700002)(9686003)(86362001)(55016003)(40160700002)(6862004)(8676002)(3480700007)(66476007)(66946007)(66556008)(508600001)(2906002)(186003)(558084003)(7366002)(7406005)(7416002)(7696005)(52116002)(8936002)(40180700001)(6666004)(62346012);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kuLjE4NM3wQhG6CkIXvp0pTjx1a4MHJLPYXlcKN6rUj6Wg7RCyDzRtZk6Y?=
 =?iso-8859-1?Q?i5tUiF1YYVcay6wSvhbTY0CLZO6Q1ZmpThBht2WGwYoi+0k3aNnIohxx/a?=
 =?iso-8859-1?Q?f/ZyZLzrK1MNKwulZmzCRvh9LUa1iBCo5jmq2G9xJHR9pvPzt5/u2sgk/A?=
 =?iso-8859-1?Q?FLFOmxH3VqXtVJBnMQBQCwYNANrqDCjBoFR0mN0EuMHI+89UE9UwhneQOn?=
 =?iso-8859-1?Q?IkUz12Hj5vH0XPEdR+J6RXpR1jAmklz640iTPA8TOsLA0ug0hhQ2JM+New?=
 =?iso-8859-1?Q?BbtPJFvMwaEI4JlgugWq3tbqsBnHummnj67d643H2sGMx01VRCm2XsWBAc?=
 =?iso-8859-1?Q?RhGrUGep/auViQFpktIsMwFe4rmD5dxcRcVthXPrOZRzmBTjASpPOgL2Wr?=
 =?iso-8859-1?Q?r523AqlQjNuSqnJ5CzM13QAARJRdiicihgO7ajbDg6xjiUw703T2fzoxa8?=
 =?iso-8859-1?Q?DJNmKhaeyWxDENgn9eobBN1qV6CcFwCbePqpiciEnB/g+ECyehUOg/GQnc?=
 =?iso-8859-1?Q?oD/fJU4/FWO8gbQq8Gpp2+6nIgRadzbacK9QXgGXMmH5/lhDZf3pQsmvHD?=
 =?iso-8859-1?Q?5DAIvH9VT5n+AiwXz5+0bo+iF24sDGSoyKE3YPx0meTnzbNLtUF6QwOJlp?=
 =?iso-8859-1?Q?RGWvA+ye7Jyjy1dD0VFFl+v710ic1BpqkcL0+VK7qotliBKg/vsrBbZzo1?=
 =?iso-8859-1?Q?ry5YoUStUjBs4FtUvG6dVX8ZoKKwiTfxb/SkEKyZAvLI+HVe9N0uhoiTJS?=
 =?iso-8859-1?Q?9YTmLdv2vIVBJmwXT42yaugcUoh8heMG39RqDP0D0Opfd0fsSHSas6sFZP?=
 =?iso-8859-1?Q?WLcvFVV403/9AOrKm26/XOaoQ2mmwUAF7ZNbcbFc3vwHsZN0/rEEreQY75?=
 =?iso-8859-1?Q?6KhdA03Vbw8EZgU2WxAvLUfjuPP8nmTZevGdJ1i692rb1NjbkbaXFb/NW0?=
 =?iso-8859-1?Q?c2YcpwJTGrA+CsA2AWxkmM00bbmqNgYp0UXaGEX0b1d9r/LZk9krcxE3GU?=
 =?iso-8859-1?Q?6+v7DSZ6LPwVE+4Equh3dvtmRv1D8cvoEurJNID60ChS0m4TQhbuCvf4z3?=
 =?iso-8859-1?Q?mifV3n3O1722DlRH+VTHH2yiT3HTy8rvLjpXv1n1mCDqRQ8e9FU9rGa5Cg?=
 =?iso-8859-1?Q?jPhwIOZbOUbJCN0YHqcENB7Aa+0nqM3vF+h8Fsk+zwnw2W9bInHjiau0QK?=
 =?iso-8859-1?Q?S6XK81L1CwS1vDbIMCMUd4RinNlv5w5SRWv5sxs0I/8WZIkydlph/j5bw5?=
 =?iso-8859-1?Q?WkBBoyZS20BcFgr32WPpGITnZu6p9IoZahboXACiN8yNzByrf3GMHsMcpY?=
 =?iso-8859-1?Q?qZbLfLAhqhgb7Wq1egu38RgG/pGysx4VD4fOkUWxEpFNVd6Unung/qItV3?=
 =?iso-8859-1?Q?YCxcQdboQDhOZXBmJztJkOcLUGe/IT2sunpc9sZh42Q82ztNGAoHRjcInA?=
 =?iso-8859-1?Q?ZV0YObC6Gcc6ZVqq7KPum8u5FEQHphCJM8tf5d+9R66/v92EkPwKdQbpT/?=
 =?iso-8859-1?Q?Stla7w6K1yAQXFDO6DdVfALVLGPvIBPpcmqIipwoUDjTOkj1HgTvRn86nL?=
 =?iso-8859-1?Q?kOZEIZjv08OPuoPKcZ2w1fpwPlSKshtQ1/Bw9Xyy3DswSrRNEoCOl6Pjii?=
 =?iso-8859-1?Q?Z5D6xxULmhAm9w6itIolEXsDHXfPj8c5m+51Jn0s+k6KYmIIoEtqXYOzk4?=
 =?iso-8859-1?Q?2nhbPtgo8g4TnzaLOKRXtxavf3S5Uect2cbMj/dcp/tw7e11U+jU/U6v3A?=
 =?iso-8859-1?Q?87Rw=3D=3D?=
X-OriginatorOrg: gientech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223188e6-8e06-4dce-f958-08da39141aa1
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 21:19:33.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wrl+RAHjHvYxBm70E+SQ0zWv+AGgFAhWqFULh9uOXbcHgh/1WSk0RqnirQhMDwhohJdf2BwL2QaRHIlvmbcdohC0W6BslP/hxO+Rd5lm90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0877
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DATE_IN_PAST_24_48,
        DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_PSBL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?42.159.164.97>]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4704]
        *  2.7 RCVD_IN_PSBL RBL: Received via a relay in PSBL
        *      [42.159.164.97 listed in psbl.surriel.com]
        *  0.0 SPF_NONE SPF: sender does not publish an SPF Record
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  1.3 DATE_IN_PAST_24_48 Date: is 24 to 48 hours before Received:
        *      date
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 FORGED_SPF_HELO No description available.
        *  0.0 KHOP_HELO_FCRDNS Relay HELO differs from its IP's reverse DNS
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Can you do a job with me?
