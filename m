Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E9AC4AB2
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 11:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfJBJiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 05:38:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58854 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfJBJiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 05:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g/WUAYfXMrYpXdQQJRf6Fhcbc8Avznhf2nXFDJSjsjw=; b=ojtHKvjN5m3G+yp00hN4OjPA5
        2TBOQk2XEcRdXwaRtw1sEkmjlTFC059k0A9r/+CWYMN32dAvsJdAox1VgiQIG7CJgPV4q0uitW+gw
        wvH49S8IR/p4dR6xyVsz7HcKiH2cWU8gwhanYMKDhAbjZZRMFi30N+NotQj0x71VXL8px2daG+Tjk
        I7DdfWu7P5Oju0S6E66mLdm1AsbDzJgNijPT/cA00MkLgZCvyjjfTw309JQt43zlVF3+/jL98cmyg
        1aUQ6XVSpd7+3r6zFhJxs1gLerP9SrpcO9yBsa5PlPb5ohAOaoyoXfcFISR9L+qVjmQpxc3yuSxJF
        nprqsAkGw==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFb4A-0006Ah-PO; Wed, 02 Oct 2019 09:37:08 +0000
Date:   Wed, 2 Oct 2019 06:36:58 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Build failed in Jenkins: v4l-utils #43
Message-ID: <20191002063658.3771c1fa@coco.lan>
In-Reply-To: <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
        <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Oct 2019 10:25:02 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
> 
> On 10/2/19 10:16 AM, Jenkins Builder Robot wrote:
> > See <https://builder.linuxtv.org/job/v4l-utils/43/display/redirect?page=changes>
> > 
> > Changes:
> > 
> > [hverkuil-cisco] keytable: add new generated keymaps
> > 
> > [hverkuil-cisco] msg2ctl.pl: add newline after log_msg
> > 
> > [hverkuil-cisco] cec-follower: drop the hardcoded UI commands list
> > 
> > [hverkuil-cisco] cec-ctl/cec-log: use new CEC_OP_UI_CMD defines  
> 
> You need to remove utils/cec-follower/cec-log.h.
> 
> This file was generated but the generated file is now called cec-log-gen.h.
> A new cec-log.h was also added to utils/common as a companion to cec-log.cpp.
> 
> Unfortunately, the old cec-log.h clashes with the new cec-log.h. And since
> the old cec-log.h was generated and so is not part of the git repo it is
> not removed as part of a 'git pull'.
> 
> Anyway, just remove utils/cec-follower/cec-log.h and it compiles again.

I manually removed the file at the builder and at the slave machines and
asked for a new build. The build now succeeded.

That's said, we should really avoid disruptive changes like that, fixing
the building system for it to do the right thing, as users of the v4l-utils 
will also face the same issue if they update their git trees.

At any time, a clean git update with something similar to:

	git remote update
	git fetch origin
	git reset --hard origin/master
	./bootstrap.sh
	./configure
	make

should work.

Regards,
Mauro
