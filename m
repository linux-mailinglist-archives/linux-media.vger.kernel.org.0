Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1A9912F88E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 13:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgACM5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 07:57:15 -0500
Received: from mxa1.seznam.cz ([77.75.78.90]:43374 "EHLO mxa1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727350AbgACM5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 07:57:14 -0500
X-Greylist: delayed 774 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jan 2020 07:57:13 EST
Received: from email.seznam.cz
        by email-smtpc3a.ko.seznam.cz (email-smtpc3a.ko.seznam.cz [10.53.10.75])
        id 501caf9687a716f350b4b151;
        Fri, 03 Jan 2020 13:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1578056231; bh=gmJYERsgZXJhuLAyaeMIXNvdxqStI1Z1MY1ZIeFMQL8=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         X-mailer:Content-type:Content-transfer-encoding:
         Content-description;
        b=VyhgMTl7w3boxkFxgAhQa9ihsYrxOmUANMgmGoF1SPNjEbUmCfjOnnvZOGvjM6KtP
         5JGF3mWfAezetpl1kWikmRR2mdGGG1Mf3sjCNKB/w25IOwSUA135J+BN7x8a4U988N
         4bNwL6NKl+zMzrTOF4DWhXogA9f+Xv0Lq+kCy/EU=
Received: from [192.168.2.14] (250.68.pool1.tetanet.cz [109.202.68.250])
        by email-relay1.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Fri, 03 Jan 2020 13:44:15 +0100 (CET)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Fri, 03 Jan 2020 13:44:13 +0100
MIME-Version: 1.0
Subject: FYI: Mygica T230C v2 works for me in 5.4.6 vanilla
Message-ID: <5E0F371D.25003.17A93399@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.73.639)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear gentlemen (you know who you are),

I'm back to "T230C v2" and things look significantly better than half 
a year ago. As far as I can tell, the vanilla driver (dvbsky) works 
just fine, I can receive DVB-T and DVB-T2. I haven't tested the IR 
remote yet, I actually have a wireless mini-keyboard, will get to IR 
later. I have a few further small issues to polish in the user space 
config and mechanical integration, before "production phase-in" :-)

Namely I'd like to thank the following people for making this 
possible:

Antti Palosaari
Jan Pieter van Woerkom
Sean Young
and of course MCC the master maintainer.
Plus a few further people in the user space department: 
Klaus Schmidinger, Rolf Ahrenberg to name just two - but there are 
many others.

FYI: I'm aiming for DVR as the TV viewer and recorder app, with 
vdr-vaapidevice-plugin as the front-end part, or maybe the latest 
developments of the softhddevice (also with VAAPI support).
Just about yesterday I've become aware of a few friendly 
German-speaking hackers at vdr-portal.de who seem to have quite a bit 
going on at that software front.
I've compiled fresh VDR and about 5 of its dependency packages, all 
without significant compile-time errors, in Debian 10.
I have a shiny new J4105-ITX to test on and over the last month I've 
spent a few happy evenings hacking away at the funny little hardware 
(mechanical integration, custom-length cabling, power supply stuff).
I'm not taking the easy mainstream route :-) It's all starting to 
take shape and make sense, and to my surprise, the Gemini Lake 
apparently renders the picture better than the temporary Skylake 
machine I used to test on in the summer.

All the best in the new year, thank you, keep having fun :-)

Frank Rysanek

