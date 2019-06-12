Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91C442B42
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 17:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437748AbfFLPuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 11:50:10 -0400
Received: from casper.infradead.org ([85.118.1.10]:55118 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437689AbfFLPuK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 11:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lZ7jhMBykRVdY/yQT29SU8tqCwPRLhDwhRSycURiLbk=; b=m49CucLekkneu5UkgnMxLwpfx6
        BPrQAcXZDq8UNx3QIACIXQRjR9QX/JrtQmUujeYWHJQA/f/qA4PgFVXbMuYkshqL1s/vzP/qTwfS7
        i96PGjwqNZ7nT65nEQGHB4jiCV31rK9GZ1Ualni7IcRFESMjVKP8BpfeJGdoODkUaxj5+0ZMm7W27
        jd4N/ylZU3iF0J8G8r1MBApxhb/y3prNO5rxXzcOYQNwodyD28kILi0qV2eYSbbEqmR0GmZdIsVgw
        FH55Cq4BYA/bT3wPHfZznyDKcjCcUzeBbpPLmWb/43eSo0JQJKZ8cDwSA4disskKSa9nh2W+IOpW/
        VQYLzMcQ==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hb5Vm-0002VI-Mr; Wed, 12 Jun 2019 15:50:07 +0000
Date:   Wed, 12 Jun 2019 12:50:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.2-rc1] media updates
Message-ID: <20190612125002.66e84492@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.2-2

For a couple patches:

  - a debug warning for satellite tuning at dvb core was producing
    too much noise;
  - a regression at hfi_parser on Venus driver.

Regards,
Mauro

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.2-2

for you to fetch changes up to a200c721956ca026f44416acccc8efcca41109c5:

  media: venus: hfi_parser: fix a regression in parser (2019-05-29 10:20:06 -0400)

----------------------------------------------------------------
media updates for v5.2-rc1

----------------------------------------------------------------
Sean Young (1):
      media: dvb: warning about dvb frequency limits produces too much noise

Stanimir Varbanov (1):
      media: venus: hfi_parser: fix a regression in parser

 drivers/media/dvb-core/dvb_frontend.c          | 2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

