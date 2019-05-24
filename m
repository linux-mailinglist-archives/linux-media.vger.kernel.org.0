Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD6528FDC
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 06:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfEXEMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 00:12:54 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34973 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEXEMy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 00:12:54 -0400
Received: by mail-wr1-f48.google.com with SMTP id m3so8427980wrv.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 21:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=6uBDGzrhR9tgJgi/3ZPmBqUwlPwB27ODVj/kHaFBkSs=;
        b=kpwMGuuZnhFIawQrzNDKgtJs90PCV19fUlao5AwZYe98oLtA+X9OxTHc3xPvlQh7el
         EFt1bnW2VJ8qw7K/md27R8fu1zK/+q6v0TA/BIBQcLpdw0+1vbxDYVeD1ysWdPpY577F
         qHeF7/LK2oMst9b0ZMy1pTivPLVCpjDT5LzX+c1qRTKvnyRmGTVUNjUgFtFaaPKSyDUf
         iUwLHUBDuEyaV/L0HtgkDySZxHh4+mh4urlbaER5+snBgJoxUUAy8guCtdqCR6Ptmqq/
         EvZAaKgdoVtSnR0kS1zWv91CSZIAAEj0cKDHHyP1O5zwf/Q2bDQ3wUbBraiafCSM7Bge
         CSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=6uBDGzrhR9tgJgi/3ZPmBqUwlPwB27ODVj/kHaFBkSs=;
        b=iIwHN28NR6pomNox6ydjzUm1S7DFSnMmBt1Dx9qYlQapM7Ky/o2cdaIA1Sxuqc0wWG
         3jj9dhI05gyxCVG+AwgKjxVYjCGeSkmMTME9Sg2IvPYyF4yzFaVEgSFkW8yrzhm2102f
         iUvmC4ai6I+SWjrtfKRFwCOHBrNfCAhZy6ojdPX5Aw0IWnKEWBpl5zcPKxmie+e+ikkX
         0kz5W6N9xbr5D8bpBAuL1Gf+13blyuxLhf5PVfVV2QK4JQwj1F+TC1cht27ChbbEtTEi
         /13Pd5Tgm3J5U4ABSvzPW6Bw4iKXIcSBLttte4YI96QBrUvG6J2wsbIB4X4FNOZWKKFS
         CgVg==
X-Gm-Message-State: APjAAAWyZzD6RnrqW9G88qQRU9CjMK+g9+Xfd7t5D9xFSUmHhaaicCis
        8K3qfZg23/wox5sQuIwE6VTbUX9h
X-Google-Smtp-Source: APXvYqw/shIzIMul2oo04y75j6DpBCgmIWfrwNM9vm/66F69/yYBzpibrY8hRatPnYh+3DQl8k+JJQ==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr8654595wro.330.1558671172236;
        Thu, 23 May 2019 21:12:52 -0700 (PDT)
Received: from [192.168.1.89] (249.52.21.93.rev.sfr.net. [93.21.52.249])
        by smtp.gmail.com with ESMTPSA id n2sm1199225wro.13.2019.05.23.21.12.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 21:12:51 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Deghetto?= 
        <frederic.deghetto@gmail.com>
Subject: rc rc0: two consecutive events of type space & strange ir-keytable
 behaviour
Message-ID: <ff3cbf92-3f43-2a85-68d3-35f9086aa393@gmail.com>
Date:   Fri, 24 May 2019 06:12:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good day,

Information on the system:

- Raspberry 3b+

- Updated yesterday to 4.19.42-v7+


Before the update the remote control was working well with:

- gpio-rc-recv    rc-rc6-mce    kodi (into the file rc_maps.cfg)

- And the following data into /etc/rc_keymaps/kodi:

# table kodi, type: NEC
0x140 KEY_POWER
0x1ff KEY_TAB
0x143 KEY_RED
0x10f KEY_GREEN
0x110 KEY_MINUS
0x118 KEY_VOLUMEUP
0x111 KEY_ESC
0x119 KEY_BACKSPACE
0x116 KEY_UP
0x151 KEY_LEFT
0x113 KEY_ENTER
0x150 KEY_RIGHT
0x11a KEY_DOWN
0x14c KEY_EPG
0x100 KEY_C
0x14e KEY_1
0x10d KEY_2
0x10c KEY_3
0x14a KEY_4
0x109 KEY_5
0x108 KEY_6
0x146 KEY_7
0x105 KEY_8
0x104 KEY_9
0x141 KEY_F8
0x101 KEY_0
0x142 KEY_DELETE


Since the kernel update I get this message from dmesg: "rc rc0: two 
consecutive events of type space", and the remote control doesn't work.

I tried to force the protocol NEC with ir-keytable -t -p NEC and I can 
this some events. Something strange, when I push a button I can get the 
event of the previous pushed button. By insisting I get the right one.

I went to google and didn't see any workaround.

Many thanks for your support,

Frederic

