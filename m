Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08974258DA
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 22:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfEUU3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 16:29:20 -0400
Received: from smtpout1.mo528.mail-out.ovh.net ([46.105.34.251]:35835 "EHLO
        smtpout1.mo528.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbfEUU3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 16:29:20 -0400
X-Greylist: delayed 542 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 May 2019 16:29:19 EDT
Received: from DAG6EX1.emp.local (unknown [10.108.57.209])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id CC3AB142F204
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 22:20:16 +0200 (CEST)
Received: from [192.168.1.111] (185.20.172.155) by DAG6EX1.emp.local
 (172.16.2.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1713.5; Tue, 21 May
 2019 21:20:16 +0100
Date:   Tue, 21 May 2019 22:20:15 +0200
From:   Dominik Danelski <dominik@danelski.pl>
Subject: Problem with compilation prevents me from adding a new device
To:     <linux-media@vger.kernel.org>
Message-ID: <1558470015.3271.4@pro1.mail.ovh.net>
X-Mailer: geary/0.12.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-Originating-IP: [185.20.172.155]
X-ClientProxiedBy: EX3.emp.local (172.16.2.3) To DAG6EX1.emp.local
 (172.16.2.11)
X-Ovh-Tracer-Id: 6737385043797057590
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I found this 
guide:https://www.onetransistor.eu/2017/05/magix-usb-videowandler-2-linux.html 
which explains how to get Magix Videowandler 2 as an audio-video 
source. It is achieved by downloading drivers from LinuxTV project, 
slightly modifying them and installing. I wanted to incorporate changes 
from the guide to the upstream code, but first I wanted to test 
everything once again. I tried to follow the described method of 
compiling drivers (before making any changes) and I got stuck with a 
following output:
  CC [M]  /tmp/media_build/v4l/videobuf-core.o
  CC [M]  /tmp/media_build/v4l/videobuf-dma-sg.o
/tmp/media_build/v4l/videobuf-dma-sg.c: In function 
'videobuf_dma_init_user_locked':
/tmp/media_build/v4l/videobuf-dma-sg.c:190:17: error: 'FOLL_LONGTERM' 
undeclared (first use in this function); did you mean 'FOLL_FORCE'?
         flags | FOLL_LONGTERM, dma->pages, NULL);
                 ^~~~~~~~~~~~~
                 FOLL_FORCE
/tmp/media_build/v4l/videobuf-dma-sg.c:190:17: note: each undeclared 
identifier is reported only once for each function it appears in

What could have caused it? I suppose that the code already in the 
repository has been checked and such thing should not happen if not by 
my mistake, but I did not change anything after cloning git repo.

Regards
Dominik Danelski

