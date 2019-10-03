Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7596ACAF79
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbfJCToe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:44:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42986 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbfJCToe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ttWMlw4HnFeQ+0ShXax9UG8yhmd1VJraa+/bhHxK4KI=; b=FIolBXXTFgNpfPbK4whbS7l8z
        0vVHAg0AafJK41BpVscAA9e/1dgfzZn9JUELGEZXL70FHVjcnQbvFU9q0vxCwW9j+ySzanvqr+W37
        0iEXMb0SpHh4kwVJFGC7GpPMmoxh2A2+zSzjB3NTnpngqQnNCF7OrjZuA1XlOzOcjdDlNx58u5e7m
        nhjw97vdYErY8BpepEV9tOb2WDyNYGDB0riToNauVhrpr9O+snGKEney6opb3lrUAJ2kFJv1g7WLS
        6/YCasftOLlzooM92LgLhgyhJ4cp2GaPkoOC56OKSELlvpNUDIkSApVDcilMiF4cEtUrebefV+TAd
        DrR/dMiVg==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG71a-0003lj-K2; Thu, 03 Oct 2019 19:44:31 +0000
Date:   Thu, 3 Oct 2019 16:44:26 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003164426.6da8538f@coco.lan>
In-Reply-To: <20191003163914.7c384d36@coco.lan>
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
        <20191003120238.75811da6@coco.lan>
        <20191003160336.GA5125@Limone>
        <20191003130909.01d29b77@coco.lan>
        <20191003162326.GA2727@Limone>
        <20191003144225.0137bf6c@coco.lan>
        <20191003183200.GA2631@Limone>
        <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
        <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
        <20191003163914.7c384d36@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 16:39:14 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Thu, 3 Oct 2019 21:19:16 +0200
> Gonsolo <gonsolo@gmail.com> escreveu:
> 
> > > try other firmware?
> > > http://palosaari.fi/linux/v4l-dvb/firmware/Si2168/    
> > 
> > I tried all of them. No difference.  
> 
> Maybe the vendor of this device wrote a different firmware. That happens.

Two additional comments:

1) The firmware file is likely at the Windows driver for this device
(probably using a different format). It should be possible to get
it from there. 

2) Another possibility would be to add a way to tell the si2168 driver
to not try to load a firmware, using the original one. That would
require adding a field at si2168_config to allow signalizing to it
that it should not try to load a firmware file, and add a quirk at
the af9035 that would set such flag for Logilink VG0022A.

Option (1) is the best one.

Thanks,
Mauro
