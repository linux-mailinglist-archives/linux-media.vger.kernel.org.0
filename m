Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFD6271FA8
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIUKFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:05:32 -0400
Received: from mail-eopbgr90081.outbound.protection.outlook.com ([40.107.9.81]:30240
        "EHLO FRA01-MR2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726341AbgIUKFc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:05:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7U1MIqzA6II4UTb2/lvpyD67P2KunszuXZMsIKzvPdnl7dwDmYTpNXpGcSoDWeLzq71/hlXdxnQw6c+szFvLqvCzSrQGeLPgP0c/HkbhK8jhlTn3PCFBvFh4jtP+BMoXtRe6UkFmHr9v4zF/A/MNrAx6EFlep4KC6puxjuFqus3inX1Mz1nHks/M/ajD0QaquU6kc/oPaF8UmL3LFBSw+ipJeWPLnHTlpXtDO4uBn7nJ2ZR5ULmzCKrxNV1InVmYEw0RZOUF4I+6v/O+XY7Tmf6LdPPM2oEBgA+lAbFByJPKacRoTi9uda4ZKsiabVPx8kh4UwjdEXlPvuiIpk4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz+N3+dmU5Weq/s6O8/4AoB56CshQuNrTgspCsMtRuQ=;
 b=CqANr8betc9unqzuZ0aQfEnhcfH5uyRK+fnAOfj2SXUlUWaBW/RWuCjaQsTqzoLd9IgMY44lOaRPypgnHsXiVZlDGfgKkWQYE7oGfFdAjFHc5NBaCgl8FMbd7Npk2Z6cbcYmczR1nPW+GGPJ9pnaLs+xa0hXkNWfp7OkoxF2v4p+DF/uDFCwqHCki9TcuftSp7tKEnZhdi/3mu/seNgsZb7oYEXAVOnWyLIzvpVz4QWmdZMIofS6prJd4YUfWlwy9AfMSdsMFISYlaF/YUN87v58+1qTJM0eOa6RTT8MnoNd6JKRmk9V4WNsgGnyunTJg8NCNo0CH2sg1o914CdWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lamsade.dauphine.fr; dmarc=pass action=none
 header.from=dauphine.fr; dkim=pass header.d=dauphine.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dauphine.fr;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz+N3+dmU5Weq/s6O8/4AoB56CshQuNrTgspCsMtRuQ=;
 b=bGetfJGqTYb27yIatojra5w9TC+opigrd/JAMAt5vxrF4u+KWivNnYv5iN5zHBNqdS8DCJzpnse/1GofIR+uVUT+yY/DE/2Tcs7Dwv6fFxONnLUHWR39li0fzzV/3sqIVoulUNlN3V1uJubLkiCfFtoBoP5N80V1ECKd9BgM3ug=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=dauphine.fr;
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::16) by
 MR2P264MB0706.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:10::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.19; Mon, 21 Sep 2020 10:05:28 +0000
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91c4:b3f7:59a8:f55d]) by MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91c4:b3f7:59a8:f55d%7]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 10:05:28 +0000
Message-ID: <de7894e8574231082ea64d1be317ed5a2faeba99.camel@dauphine.fr>
Subject: Consider updating www.ideasonboard.org
From:   Olivier Cailloux <olivier.cailloux@dauphine.fr>
To:     linux-media@vger.kernel.org
Date:   Mon, 21 Sep 2020 12:05:24 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:9::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from saucisson (2a01:e35:2e49:2720:18e2:21d:6da8:c492) by LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Mon, 21 Sep 2020 10:05:27 +0000
X-Originating-IP: [2a01:e35:2e49:2720:18e2:21d:6da8:c492]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 545c5349-d730-4776-6510-08d85e15ddbf
X-MS-TrafficTypeDiagnostic: MR2P264MB0706:
X-Microsoft-Antispam-PRVS: <MR2P264MB07062EC10C387E3C8CF06E4BD23A0@MR2P264MB0706.FRAP264.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pVWps9X42Fw/lyxCwA1e4FnQmSG2OkKAZZkFAIlyjL8YJB28+N45N390i4SC2vMsuuQZkITfC3TMK6aayfE5tpPi0u2w0KlOhhGhuOA7+d9eEVbj4Rs6vZQf9HPudvekFWRqG/GbkNPbU14REjSk9BN4q4hD5nQHuTidSkDgnhF5NW6Lkxr9CFOVqhOc9x/4lFQZjyPe3wtuBtcWxnu/3gTIAfOzGXt9t2le8Q2qRcAGmwJbadyDPn+ykYQVIBIjQSh1MGUr9Eezs0Oa6DlAzb25XgIZ+5Q5gJ0kCmTVEGrQhuacavpEGLBKgELFqhztAXmnZrPJNNDIbhYNPt6CfGgL9qRY6oNFZ7cjiml5kiFVDiN0at5DPB1il9jCLfLOWzDa336fW4LJBq8kD/d06thskWwKRf+ivxHJ8YL5Xbxy3Dcpx6eTqnK6YXrCfeDTkM96NSoLqikBveFfyUXCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(66556008)(2906002)(83170400001)(6916009)(66946007)(36756003)(66476007)(186003)(16526019)(6666004)(2616005)(6496006)(52116002)(4744005)(8676002)(478600001)(316002)(786003)(44832011)(966005)(83380400001)(6486002)(5660300002)(8936002)(15974865002)(163123001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4cA4t2bnGfpGzUK2yCxWQVdBR506/mcC4nzUENjzx9r4WSgjgdVQ5EBHsbopNhJ1P1rRe9ncg1xX9hAi16Vk+TFyXbOzHGRypTqm4wlfTgViJnpiHEXdKi1i41JdisiqY18DUuGTUHKckPxpsTsoKksk1Aadie9K81HTvrYr0tgdPqaBrXKCcBNTiURF8dGc9kpfwp2/7PIAyNBQDRvUEmJLSlLQMxmqxpVgK6ukF2WofmNpryJDemTSglbMXz4HSkMiwF9r/7QT34TkoHjADhKWzlUmV+CEqHhc1eNuB9th2Ur0/PBoL0IbRe+qZCEUx1NhOXSnWn/7EcS07skrTkX47HYbom2ovhcKpAzVzMMJ4LNHqXqXGzWh2XWhsC85xiaFyFkidzX5Sukijk6WYyp/WPnUrszy1Q3fE8g2L+LQ88rtpJWrHymi1DHbWpWcVH4XU1q+oHrpMTpD6+HqKSe+ImA5vU4ERez6lPxzaZ5QrxyYBvL6yet8VrCyqJwbFj8NVTZnVxKjTxmD/eiyd7SR3leqFnfntVSjlljcARHcOPUbj7nWM4GxQfs/KG4tfocVoi8s1QmuacTLoBVESgHrNxt9XzGndj1f2uVRBC+fwfXwl3gK0/m+WFTR32gqI0gl22BLzZgSYB1eqRFOJKLQvF2kZ395Ddgqu9DpLCT3BSmgNpLj0RRHV+J91RLbh3kSjP8fM7wcVBfSv3JhMw==
X-OriginatorOrg: dauphine.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 545c5349-d730-4776-6510-08d85e15ddbf
X-MS-Exchange-CrossTenant-AuthSource: MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 10:05:28.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 81e7c4de-26c9-4531-b076-b70e2d75966e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnwHiyRBIZYt4nXOlSTVk3z3jJIEGwYab0bKoVy75B5cbIZXyuA+nm5DBMv6mZ7SYTu3uZViPtr8VWUB6JAnWSvMRwmcm6R6l9t7eMkUNlx2sOFw9E2msUDOSEvahcPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0706
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A lot of search engine queries send users to www.ideasonboard.org (for 
example, https://www.startpage.com/do/dsearch?query=linux+uvc).

AFAIU, information there is mostly oudated. In particular, it indicates
that “Support requests are handled through the Linux UVC development
mailing list [linux-uvc-devel@lists.sourceforge.net]”, whereas it seems
to me that related development now happens at the linux-media mailing
list. It is not easy to realize this and visitors might be misled by
this oudated information. (I have taken quite some time to realize this
myself and I am still unsure of my conclusions.)

Could anyone confirm that linux-media is indeed the recommended list
for problems related to the uvcvideo driver? If so, does anyone have a
possibility of updating the website at ideasonboard.org, if only to
warn the visitors that its information is outdated?

Thanks for your consideration.
-- 
Olivier

