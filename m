Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244416EF61F
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 16:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241279AbjDZOPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 10:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240825AbjDZOPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 10:15:50 -0400
X-Greylist: delayed 179 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 26 Apr 2023 07:15:48 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA765BE
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 07:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682518198; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ijlpGLEz2OILCqlT2gnq14GC+DnSMwoDxbXOBw++eCQb5peTUvMU5mLQJDg5rUl9Vg
    2EPwaNxUNX5YVNFGH8KrF4XwuC1Eo7VYoqId60LrskW3spLwWSk0TQmxskfOjovyZICv
    ZXTF4bbfv0nCrEieikxFPFJtpxtGvIpTw+NAyO7X/4va775aeH9orxSBZ0V6qsLokbQ1
    Q8P36cHRzXU/c+hb1Jl2oh6xQfyCYSZoWKjcdAo5/lGrylKoIe/meyLPnrpOaenhMmuK
    r8eDANSyWzxPN2sl7eWKWQVsWYA8ayHp8IBwjAw7KRaSavZRXQfUbF4rz6mwoj/CuzV3
    q0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682518198;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=0d+5dvz55ZyEQxxnr4MKzBQivCLHLxIs2uXNQ7//710=;
    b=VRxNsWnHJh3+CVKT69FSGgXHLS6ctpATL1QVfY028i00zLVIhRR0ArCU1T42DTAAP2
    9fK2CRwp6RPu3bdIBUozOOECyBfCDjYYzbkEO4BQphNRueig9QnDVXnWbLvb6qSaSDRR
    4noeYsVI7MYMg4y+2GfDvEeTYSYmPeMNYhRU2Oy2eBchPVX+QrbZdi1Sb4HG8g1myBTv
    dugYuv5oDQl7Yt1HEvDTpotCHl3Y4REYJPQfCMt1woFLWpWNnlqdxnP4p8XNbGWiRgr0
    5k14Ct+wTolSGlcnRS4k0+nUODHnAQB3V84yNJlG3zogxVZhgUGvWnFaP1jpU1wwTnHC
    kfIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682518191;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=0d+5dvz55ZyEQxxnr4MKzBQivCLHLxIs2uXNQ7//710=;
    b=WITmORowKYVrFy7uUP63yENBMfEoN0h1GG+QTIUfTA6RkilFgZgy6CO2vpe7Kthnz5
    0cN9ugFE2pUsL0bwhnqwXAM1v1PDOgpJiPWMMIIya5sh4SyMiP3gvzKVyWKgIQtWi16+
    35PTssz/2Hb5kkZxjs7nG/CJ2F6HzDheDvQhMLa8Cc7HbyJc+o6zyNv0zjT4Z7izQLPJ
    IPz+xbP2GrDkK/46O+F9AD6O1QOE8AZCJxbSKHaVksrbcC8Bmu0d7IwYTzoeBF26QoPP
    Y9H2jSkN3PSjVzHY2r56JI9SsZFnrK/aJ1/JY8ZgyMoXZRc5uYtKZBJIuspX86APAonH
    ObpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682518191;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=0d+5dvz55ZyEQxxnr4MKzBQivCLHLxIs2uXNQ7//710=;
    b=ak07ZdprOE4eIjn/jXuMPFBESeS2B1daka+dmZIRsiCMam77nBIb82+2hAixDb+Lim
    rjHvM4jp5fy2jNIsjcCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiGvc0He8jojKcjHG7sNapFxmSgZQ=="
Received: from [IPV6:2a02:8109:8980:4474:cd64:5f46:caee:cf85]
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez3QE9l3te
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 26 Apr 2023 16:09:47 +0200 (CEST)
Message-ID: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
Date:   Wed, 26 Apr 2023 16:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Content-Language: de-DE
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

TV Time doesn't work anymore on my Cyrus+ board with a FSL P50x0 PowerPC 
SoC [1] and on my P.A. Semi Nemo board [2] after dropping the overlay 
support [3]. It starts and then the whole computer freezes.

I use the following BTTV cards.

- WinTV Express with a BT878A chip
- Typhoon TView RDS + FM Stereo (BT878 chip)

It would be really nice if we could get the overlay support back, 
because we love TV Time. [4]

We use TV Time with connected TV receivers and game consoles.

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=X5000
[2] https://en.wikipedia.org/wiki/AmigaOne_X1000
[3] 
https://patchwork.kernel.org/project/linux-media/patch/20230302125731.1124945-4-hverkuil-cisco@xs4all.nl/
[4] https://tvtime.sourceforge.net/
