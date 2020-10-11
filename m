Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222AF28A6AF
	for <lists+linux-media@lfdr.de>; Sun, 11 Oct 2020 11:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgJKJdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Oct 2020 05:33:43 -0400
Received: from mail-eopbgr120085.outbound.protection.outlook.com ([40.107.12.85]:3371
        "EHLO FRA01-PR2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725863AbgJKJdm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Oct 2020 05:33:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuL/4e6cPbY2/gOGeVSa1OEoCabwZg46DPV0QLj+vFMeJ6HJs8OPe5bt3w9u7RZnHoBlVNrRd2AQE4ZlqUew6vQZNhzuD8yygVyL44a6oqKwWkJUHbUAhWkzLWT5jgLEg0+MJDH43A8ZamNe4UpxmoX6aQDSzrPW8X6OqXWZHuqWBwKwzFlvDBSRITdaWnf6cOFl4zs/8lo2bnEr1TS7kzKHIQd82B2MBTe/PY5jBLoLnfjCUYk1OaVnwU3D0ltpWxrNZUQ6OChGEiwaEx4wdLb5jdUXFUYhv/teRwhTgb2MZt/z/LOEv6izgwqiP8UPR/4GW1UOrW925o3kNUMlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOVQgupFLQy+tlVvJSZvLtTBEak/7vZNsFPUhiHyYV4=;
 b=Pdv6Fb+HuvszfUYoxEGw5lnheiTt27e3riDBRrPE+YkVfuVTC3o73VfJO59nc+kTAE9CQX3ANSh5T/VqoKGYNfhyEMg9tCV9QIZVbvpEDBfPJZrkFkqT5/75IuObtft2JYjRXlJG9Or8/ptJbFqcgYzdyTd5sXenS5l1loFQMvcOmkcXahkNBXzn5lENHybw2ExNtS+e/WdHDSCNsBMRotcAiJx6X4aBhyk7OubR1nzPH3LxRxig2S42GtYoGuKosUwnp71dehk7v5cwE93lwjMrYzT7j3AiWNh/LLrslD91+1QwK0N6cWQtewxpDkiUSK1dj/Wjb0i6AG/mk3gfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lamsade.dauphine.fr; dmarc=pass action=none
 header.from=dauphine.fr; dkim=pass header.d=dauphine.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dauphine.fr;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOVQgupFLQy+tlVvJSZvLtTBEak/7vZNsFPUhiHyYV4=;
 b=PbhZ2JSm4fLhP9Xe9HbNzE6cFd0VrT1d0B/bJz1RN6L9WhLgqW20i7dJPdMGgRizG6vyRUeHKSaZL2JhhZwubyGOdjaIVN8m0Bgk8lPCE6FI3cTTQif7Ye8g6ndX5oq/cm8AgFwkqEP1xbYLZ4S81pg42+rvwRl+Fw1hmYF2CeM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=dauphine.fr;
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::16) by
 MRXP264MB0645.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.28; Sun, 11 Oct 2020 09:33:39 +0000
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::716f:7591:e998:58a5]) by MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::716f:7591:e998:58a5%5]) with mapi id 15.20.3455.028; Sun, 11 Oct 2020
 09:33:39 +0000
Message-ID: <bee747f5a84869216a7b63916244087978c1a371.camel@dauphine.fr>
Subject: Possibility of help for a partially supported device?
From:   Olivier Cailloux <olivier.cailloux@dauphine.fr>
To:     linux-media@vger.kernel.org
Date:   Sun, 11 Oct 2020 11:33:35 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a01:e35:2e49:2720:18e2:21d:6da8:c492]
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:9::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from saucisson (2a01:e35:2e49:2720:18e2:21d:6da8:c492) by LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Sun, 11 Oct 2020 09:33:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 752e8ba2-65a1-42f5-826a-08d86dc8bc51
X-MS-TrafficTypeDiagnostic: MRXP264MB0645:
X-Microsoft-Antispam-PRVS: <MRXP264MB0645674D716B85F31F509392D2060@MRXP264MB0645.FRAP264.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +e/i7Ngy7wvQA4/R1YxXKpn2JLlAGUuT8XgZ7oNwLUcWoZvtJ/prXsZVWS02ae07D0ctPjrs+6JM3v6LJFelHdUWqSll/2IIOuXzUeE16k7NOzrYMFECOYGvLyI8/fkFFlQ4XfbGrfVT0lL5Sf5Y+X1FvybXMVzwmml5Z9dmsazDwKsPm3WfDq2/lIpPpWSsZgkr9N5IB/9lhqNcdKyhP/TUakPcwaMkqtYkULvug2qEJS1C5PD/SETZ+JfYQSO0+Jvl/s11pVvYtGTvLE/+88NsOkiklBP4C+ZsST2FNgA9oStxs9o+cxB1rMTaL6ORbMwR54SwC2sOM968fMMP+t4eli8bFwh/RSy4rxUoOSGjw7Mm9nWm4E/fuc/SHgzaipIKBQ7Gi2sEeGuToZrMNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(83080400001)(66946007)(966005)(44832011)(66574015)(6666004)(8676002)(2616005)(6916009)(83380400001)(66476007)(66556008)(6486002)(16526019)(52116002)(83170400001)(8936002)(6496006)(5660300002)(2906002)(186003)(316002)(786003)(478600001)(36756003)(45080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OuDM9nWztsAHkdUyRLxX1QAjnMj+jz1lojZsi3XZmiz7vzpaMJCwDESdpHRzLN+PvuFyLqhYu0yjeoA3KmFKlY8vEJLqZ6gfJw9yplVMoQmYeNxULDZdNbSv+FAr65G3emOQGcSabtuvJTJ2z1m2u3ArjQbKfWGwjbfAqxEUlxmLBXdzNPBz9nJx3PEP1GRNoY5MHHKDuu27Pcb6MbRweyq4nWK4ByX/B3mYz5mk/ZLjRDZKWz+4a0fp7kC82Ctdppg+CZJhEm3dcAX5LnSnPiHSXFhiCaUitxKjwPefZdlwo1MPQOV6ChoMWpLoRVcMvngmh2ekPIXSk6OaAucgrG2vG0a1PrLaQkFs4Xrq8136V/c2/8YwSC6Xa0lhXNCkT9RKcTiHdFJt2PBzHyi/DC58c5HC61BTrbvwHbXZ0KyagI8biemmCP5EdMazzGuu7InA6rgJnoB/DMeM2OKGXywAsXd9h2PkfsWmXhkNVuj27goYTi5crHGO7exKhvsuriJtCI+gcR49xKpwO4XUHpVsnR9oaH1Q24fCKZ56VEWg8w/PR0155vfR95vnJqyIL7p+W8PnjQcpvfGEOJd0b+0Gf+J6AUBEiwCfwmzUb62wV+gGckPZTGX69UbTgUhKF4yGRa7hj2f4rzHiiZx/idOlBCvTgz56jn8xrfpuSWZVbO2nR8FaY/SBkuLdpDYbhDbTg90Oqk1JD/8GZla0bw==
X-OriginatorOrg: dauphine.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 752e8ba2-65a1-42f5-826a-08d86dc8bc51
X-MS-Exchange-CrossTenant-AuthSource: MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2020 09:33:39.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 81e7c4de-26c9-4531-b076-b70e2d75966e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/IWg8/008jNhNhZrVTBUJ3Y/BHtxmPWB8C2XFJ8wpzG58jGAjZs5CNNGb5Qbx9diDEJIXHTz/omUc+wzJEvCj6PlbyVORKc0mOWKB1hJ2C5ez/AyFOr7aV/oYDijCEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0645
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear list,

The UVC driver web site (http://www.ideasonboard.org/uvc/faq/) reports
that when “I have an UVC webcam but it is not working”, I should follow
a given sequence of actions and post the resulting findings to this
list.

I have an UVC webcam but it is not working. And I (think I)
followed the instructions and posted the result (
https://www.spinics.net/lists/linux-media/msg177756.html) to this list
(the faq points to the linux-uvc-devel mailing list, but I know from
another post that this one is the right list, 
https://www.spinics.net/lists/linux-media/msg177462.html). I got no
reply.

Let me state clearly that I do not believe that I have any right to
complain about this. I am not paying for a service, open source
developers have jobs and lives and more feature requests than time, and
so on. This post is a interrogation, not a complaint.

First, I wonder if, despite having tried to follow instructions, I
would have missed some important information in my earlier post, that
would discourage answering it. If so, I hope someone will be kind
enough to answer this meta-request about how I should have better
phrased my initial post.

Second, I wonder if perhaps it is a general pattern that readers on
this list do not have enough time and interest to consider such kind of
requests (as suggested by the existence of similar questions I have
found, linked in my previous post, that also went unanswered). Perhaps
this depends on the age or popularity of the device, or other factors
that I ignore but that I suspect some developers here may know. If such
a general pattern is known, may I suggest that the wording on the UVC
driver FAQ be modified, so as to inform readers (if vaguely) of the a
priori chance that their request be considered? (Perhaps specifying the
cases which tend to be considered and those that tend to be ignored.)
This would save everybody’s time.

Third, I wonder if the “Hercules Dualpix Chat and Show” Webcam
(06f8:3007) should be granted a footnote pointing to my previous post
in the table on the website (http://www.ideasonboard.org/uvc/)? Unless
a single report of defect is not considered sufficient to raise serious
suspicion.

Sincerely,
-- 
Olivier

