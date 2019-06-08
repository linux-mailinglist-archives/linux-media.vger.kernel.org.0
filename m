Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0313A278
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 01:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfFHXbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 19:31:50 -0400
Received: from mxc2.seznam.cz ([77.75.77.23]:44162 "EHLO mxc2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727424AbfFHXbu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 19:31:50 -0400
Received: from email.seznam.cz
        by email-smtpc10b.ng.seznam.cz (email-smtpc10b.ng.seznam.cz [10.23.14.45])
        id 5468859683d33cf354c09b51;
        Sun, 09 Jun 2019 01:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1560036707; bh=Jrz8ms/FtAz/NGByia9CNOWrbhod7w9s1Duk2QyFi/E=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         X-mailer:Content-type:Content-transfer-encoding:
         Content-description;
        b=Z18wgnD0F61hpIW1VbEyuzDbLKX3SwutCwhG8L3hqfgpxl7GdvuJn4tqtDuy02SmC
         6je8HxUTPvwIL8lxVzzeia51fyLMNH9ppWSKYxDzllQmdjPAC86SCewO1qqFHveJut
         EJ/lbqdKlSdHT34ZcYzIcHhd8hOjgK1eHrjpJsyw=
Received: from [192.168.12.172] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay2.ng.seznam.cz (Seznam SMTPD 1.3.106) with ESMTP;
        Sun, 09 Jun 2019 01:31:45 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Sun, 09 Jun 2019 01:31:43 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] dvb_usb_dvbsky: add support for Mygica T230C2
Message-ID: <5CFC455F.2630.246E534C@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oops, it appears that JP also has some updates.
The version I've just posted (a "lint cleanup" of JP's previous patch) 
is already out of date :-(
Apologies...

Frank Rysanek

On 9 Jun 2019 at 1:25, Frantisek.Rysanek@post.cz wrote:

> Adds support for the Mygica T230C2 into the "dvbsky" driver.
> An addition is also needed in the "si2168" demodulator driver,
> and a PCI ID in dvb-usb-ids.h .
> Tested by patch author on a T230C2 and on a T230.
> Tested by Frank Rysanek on a T230C2.
> Applies cleanly against Linux 5.1.7.
> 
> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
> Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>

