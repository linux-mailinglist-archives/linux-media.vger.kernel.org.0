Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51FF429068
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 07:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731891AbfEXFbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 01:31:10 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:36658 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731890AbfEXFbJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 01:31:09 -0400
Received: by mail-wm1-f47.google.com with SMTP id v22so590231wml.1
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 22:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=HlHMQN2cRft1R4WQv+JT7j+Eve8N88uacqXCEWPtQoo=;
        b=ND/kW6luMNf2rjwGqgGOhqITksWL3z48ab1yc/mzJHpEgxst146J7XoktKrJh99mxv
         ujeic1NaEYfTG4YHnhO6fzDtoIJPxKcMflEAAhXcN5VBalvWlpeHcu30qbT1q65mP3Xw
         C64WPMzX3QsbGNc0nx5Xiobor/QLBeumxaU6J/adqIAaxrk2dL/A4aqJP6H2pFlxhisP
         20d3PJ/kJcPK6bWjA+Ybttrw6rdut66w0ZfKMpEyLTWN6PUlnD4JCvWyX0Uh6x5afJcV
         E474udo11YOUGgCV9trO4tns03/+G87Xu6Lyk4f4rwHnsyGODqN1ILDwRU61VevReB1d
         A8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HlHMQN2cRft1R4WQv+JT7j+Eve8N88uacqXCEWPtQoo=;
        b=nk9HRnjBZypxCvYMoJXGjW3jwnqqfWSIwRX2cdmMYS7owwJo4OLjRI6ocmQtFMAiua
         xXWICfzOw31CkhUOwvItouShJN2ArzHaIa8F2JYUhRtWEma6fueXy7OkoPgPemeNFyJD
         jeGj/PbrzMyODUd9UccnNNQgsJ5RIfoWB1RbwP3HcPtl2qRpV6DrfuUDMkTgoKYO7kby
         8tNFQ6XBIkPFpcYHxnR6S3kb47J9UHtL3rWddLq1fxWUmZ9uujQerYIEG4UChebPaVcP
         d3LNWzykyyi8LCW3Cy7788v5XW+tdg/zWwF+S9a2soivLCCYHM94c3cHYWySSIGaFFdb
         hUBA==
X-Gm-Message-State: APjAAAXGa2y281sFzllH9qubirmso/98to6yQjrdAT9A13ZFC/+xWfVD
        NfwWe4Oh+Z0GNvlMX6uEtZ/qUBM2
X-Google-Smtp-Source: APXvYqz+068rY1DZ/bCod6jNpmEypo9U3VC4MKH5pnnY69Kqi7XhOXN30h8I827R1dCD/Wg1VADtmA==
X-Received: by 2002:a1c:6342:: with SMTP id x63mr15275815wmb.58.1558675867349;
        Thu, 23 May 2019 22:31:07 -0700 (PDT)
Received: from [192.168.1.89] (249.52.21.93.rev.sfr.net. [93.21.52.249])
        by smtp.gmail.com with ESMTPSA id l18sm3799493wrh.54.2019.05.23.22.31.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 22:31:06 -0700 (PDT)
Subject: Re: rc rc0: two consecutive events of type space & strange
 ir-keytable behaviour
From:   =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Deghetto?= 
        <frederic.deghetto@gmail.com>
To:     linux-media@vger.kernel.org
References: <ff3cbf92-3f43-2a85-68d3-35f9086aa393@gmail.com>
Message-ID: <63e2ee50-6ba0-c231-2062-ad892b037bac@gmail.com>
Date:   Fri, 24 May 2019 07:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff3cbf92-3f43-2a85-68d3-35f9086aa393@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Probably related to this issue; ir-keytable -a /etc/rc_maps.conf -v gives:

/sys/class/rc/rc0/protocols protocol rc-5 (disabled)
/sys/class/rc/rc0/protocols protocol nec (disabled)
/sys/class/rc/rc0/protocols protocol rc-6 (enabled)
/sys/class/rc/rc0/protocols protocol jvc (disabled)
/sys/class/rc/rc0/protocols protocol sony (disabled)
/sys/class/rc/rc0/protocols protocol rc-5-sz (disabled)
/sys/class/rc/rc0/protocols protocol sanyo (disabled)
/sys/class/rc/rc0/protocols protocol sharp (disabled)
/sys/class/rc/rc0/protocols protocol mce_kbd (disabled)
/sys/class/rc/rc0/protocols protocol xmp (disabled)
/sys/class/rc/rc0/protocols protocol imon (disabled)
/sys/class/rc/rc0/protocols protocol lirc (enabled)
Table for gpio_ir_recv, rc-rc6-mce not found. Keep as-is

like if rc-rc6-mce was not available anymore ?

Have a good day,

Frederic


Le 24/05/2019 à 06:12, Frédéric Deghetto a écrit :
> Good day,
>
> Information on the system:
>
> - Raspberry 3b+
>
> - Updated yesterday to 4.19.42-v7+
>
>
> Before the update the remote control was working well with:
>
> - gpio-rc-recv    rc-rc6-mce    kodi (into the file rc_maps.cfg)
>
> - And the following data into /etc/rc_keymaps/kodi:
>
> # table kodi, type: NEC
> 0x140 KEY_POWER
> 0x1ff KEY_TAB
> 0x143 KEY_RED
> 0x10f KEY_GREEN
> 0x110 KEY_MINUS
> 0x118 KEY_VOLUMEUP
> 0x111 KEY_ESC
> 0x119 KEY_BACKSPACE
> 0x116 KEY_UP
> 0x151 KEY_LEFT
> 0x113 KEY_ENTER
> 0x150 KEY_RIGHT
> 0x11a KEY_DOWN
> 0x14c KEY_EPG
> 0x100 KEY_C
> 0x14e KEY_1
> 0x10d KEY_2
> 0x10c KEY_3
> 0x14a KEY_4
> 0x109 KEY_5
> 0x108 KEY_6
> 0x146 KEY_7
> 0x105 KEY_8
> 0x104 KEY_9
> 0x141 KEY_F8
> 0x101 KEY_0
> 0x142 KEY_DELETE
>
>
> Since the kernel update I get this message from dmesg: "rc rc0: two 
> consecutive events of type space", and the remote control doesn't work.
>
> I tried to force the protocol NEC with ir-keytable -t -p NEC and I can 
> this some events. Something strange, when I push a button I can get 
> the event of the previous pushed button. By insisting I get the right 
> one.
>
> I went to google and didn't see any workaround.
>
> Many thanks for your support,
>
> Frederic
>
