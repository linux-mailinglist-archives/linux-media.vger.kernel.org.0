Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50B93A50F2
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 23:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhFLV0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 17:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLV0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 17:26:07 -0400
X-Greylist: delayed 184 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Jun 2021 14:24:07 PDT
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717AAC061574
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 14:24:06 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc4a.ng.seznam.cz (email-smtpc4a.ng.seznam.cz [10.23.10.105])
        id 007bbef8d7c0079d00d3a03f;
        Sat, 12 Jun 2021 23:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1623533045; bh=biO9MiX9+s+3zjObTbD6rPRJ7EVcESPl9t/MHrpInYQ=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=jZCtBqdestkMTnvwgtX0palu+vYHyDWhfFk1DvgZxgKtB3AZd1kyQBw5JGNdzHJLX
         ULH7XizaiqNCaVg2CY6vO1Iyw2I5adQd8U2YCTJJw+/RisVb//aMedtWi9+31vcnMS
         uxlpYra6g6lUq9fYenvVwg+jh1ndH/OAG6Za7kxI=
Received: from [192.168.30.118] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay11.ng.seznam.cz (Seznam SMTPD 1.3.125) with ESMTP;
        Sat, 12 Jun 2021 23:20:56 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Sat, 12 Jun 2021 23:20:53 +0200
MIME-Version: 1.0
Subject: Re: Logilink DVB-T2 stick VG0022A
Message-ID: <60C52535.20482.128FE994@Frantisek.Rysanek.post.cz>
In-reply-to: <20210612084102.u3hvrlfudu3sz3vj@pengutronix.de>
References: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>, <20210612084102.u3hvrlfudu3sz3vj@pengutronix.de>
X-mailer: Pegasus Mail for Windows (4.73.639)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Guten Tag Uwe,

What does the signal level and CNR look like?
Not sure if your TV viewer app can display those stats.
The femon plugin in VDR can do it.
There are command-line tools that can show these stats:
https://linuxtv.org/wiki/index.php/Dvbv5-zap
https://linuxtv.org/wiki/index.php/Dvb-fe-tool
I am slightly sad that these tools show signal level in %, rather 
than dBmW or dBuV.

In my experience with a single dongle (the T230C2), CNR of 25 dB is 
barely okay. I've never seen a CNR better than say 38 dB.

Frank
