Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBC5C9FE7
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 15:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbfJCNxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 09:53:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45745 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbfJCNxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 09:53:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id q64so2819926ljb.12;
        Thu, 03 Oct 2019 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AMFhHGDka9dCxJUJcOVszQNFFh6a4bpySU4PDV1weJs=;
        b=QhCOKZ1KJFZdmR9eH6qUjmY495cXMj7Pd3IhZP6Y/20sJ5BXRdkNC8+P0HrFUrP6v4
         zxf+g4i9PzaI+l8zHaFj+tMEjS78mIjjqTPYkFptISoHxQfZe/rBjVJAZtNY9CEdgxcL
         at4WOYPK2VgMYmYqOUO48UtZ4OnqLHLeunlOePk5U3G3Ysw/dLsN/BjND73Lv8qhmfyr
         sMungIEowDyWpQA7iicnt5HDkgy9AsBLrSrEQsfEN2Wv7C46M1KGltVmcMUUJlpt+rY5
         uua+3j5sNjhVvzHKRiKoYoDoxMsJIHkUGAheS4tw+Jc11SavchgV/oGE78pk+m1XiMic
         S/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AMFhHGDka9dCxJUJcOVszQNFFh6a4bpySU4PDV1weJs=;
        b=CH1VaAgI4eMHDdlXCuG1zsTkMgSUPJhD5BuQLaog+98Cv8sNPTRrrVnvQwkCm13AwG
         2uHWSmeuQyQUq9t4Yh3yIYEz3Kgr/ysVc0XQWnbIJ64Q7n1WRfELh3UKlPUUDNEomWQ2
         IgJKV0xQIl19FjKR4xq5UU4+EMgvzKstcFGUzNI6Zgndkd78ViJ7uiBpM2q/DqjJG7zq
         s+P9Z5FK4VG8oUgditfrVMhXjhXCTOS0gwNUYJ7NYYViYFBpEnlDEvHGU0M3YktOL7E9
         /pLjNmbUq29SCUHLDUnMWihXIDs0TG+lQuyrbW8jWDbc3nadwZxp+izk/ELEDzUZrvCf
         WN1Q==
X-Gm-Message-State: APjAAAXikaPGSzTFZ0XoCJjgiczuqHSjn8MaJyTxA371eKAJv46jl8uA
        vbRfPBEIfpSShJgzEo5xZqC+sLQAu9M65z3vT/Q=
X-Google-Smtp-Source: APXvYqzuTnUFwWVWJKxfHjc1944DYqKF4QQc3InsUU3j1hDlBy9wElyPttPErwIVt6n0G5PbSlPPKEZkBp4sM1RUrYc=
X-Received: by 2002:a2e:530d:: with SMTP id h13mr6174753ljb.109.1570110821778;
 Thu, 03 Oct 2019 06:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
 <20191003081742.0933264b@coco.lan> <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
 <20191003094904.3aa5fdc7@coco.lan> <20191003095237.2efa0e7f@coco.lan> <20191003130224.GA2596@Limone>
In-Reply-To: <20191003130224.GA2596@Limone>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 15:53:30 +0200
Message-ID: <CANL0fFQR4KDU5PKeedK6wF45nSTu6dUyz_MBwmP1QsJxYQAWNg@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

I tried downloading a new firmware via

       case SI_BOGUS:
-               dev_info(&client->dev, "Bogus chip version, trying
with no firmware\n");
-               fw_name = NULL;
+               dev_info(&client->dev, "Bogus chip version, trying
with new firmware\n");
+               fw_name = SI2157_A30_FIRMWARE;
                break;

which I downloaded from

+               //
https://github.com/CoreELEC/dvb-firmware/blob/master/firmware/dvb-tuner-si2157-a30-01.fw

resulting in

[  209.312086] si2168 1-0067: downloading firmware from file
'dvb-demod-si2168-b40-01.fw'
[  211.535097] si2168 1-0067: firmware version: B 4.0.25
[  211.554938] si2157 2-0063: Bogus chip version, trying with new firmware
[  211.554944] si2157 2-0063: found a 'Silicon Labs Si21255-\xff\xff\xff'
[  211.557978] si2157 2-0063: downloading firmware from file
'dvb-tuner-si2157-a30-01.fw'
[  215.739092] si2157 2-0063: rebooting tuner...
[  215.755271] si2157 2-0063: querying firmware version...
[  215.760756] si2157 2-0063: firmware version: \xff.\xff.255

. So even with a new firmware the queried numbers are bogus.

g
