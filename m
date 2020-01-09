Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E2A135DB6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 17:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733208AbgAIQIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 11:08:12 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:50694 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731574AbgAIQIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 11:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IHiuUsn5x8+hiu8CxLUMdbdUcfmsxZzyXrApUMHtaDc=; b=CWCJbqBRyIQUt33VTPMZVKBsP
        hMHVgPQ821IZtbcp9abRpDJFStNCQNngD4JC4a3u+4mxKRjb9t3Kkj7eSgMfjfDGlpo29fv4PMwiM
        wky/mYPaXfKQApNYReyXIrcZGZMODpRy7FmNQo0RY3pcxnFnf9FdxHTXgtvc+q4zrm0bVI5CniMap
        FXpB0ur1XPkoILyQQ15/JUl9KX8m4fuJtSOT7dNqomhnqQvCy96r6y+JtmVFHWwBhmUUNF71Xvlgm
        Znc8UoZ9Rf1gUhWU2O1eCPVCSP2I7hxl4/SPNdJ576bFXuMQKmFiKhOPPNQfaSQz+7wAY53c1GGbV
        85cl460Yw==;
Received: from 177.206.132.169.dynamic.adsl.gvt.net.br ([177.206.132.169] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipaLs-0000tB-Sb; Thu, 09 Jan 2020 16:08:06 +0000
Date:   Thu, 9 Jan 2020 17:07:50 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 0/1] Implement a DVB Dummy Tuner
Message-ID: <20200109170750.12746fcc@kernel.org>
In-Reply-To: <20200109152408.919325-1-dwlsalmeida@gmail.com>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu,  9 Jan 2020 12:24:07 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This patch series should implement a dummy DVB tuner as part of ongoing work
> on a virtual DVB test driver under the 2020 Spring Linux Kernel Mentorship Program.

No need for a patch 0/1. If you want to send just one patch, just sent it
directly as:

	[PATCH] foo

> 
> as 
> Daniel W. S. Almeida (1):
>   media: dvb_dummy_tuner: implement driver skeleton
> 
>  drivers/media/tuners/Kconfig           |   7 ++
>  drivers/media/tuners/Makefile          |   1 +
>  drivers/media/tuners/dvb_dummy_tuner.c | 153 +++++++++++++++++++++++++
>  drivers/media/tuners/dvb_dummy_tuner.h |  20 ++++
>  4 files changed, 181 insertions(+)
>  create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
>  create mode 100644 drivers/media/tuners/dvb_dummy_tuner.h
> 




Cheers,
Mauro
