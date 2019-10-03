Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2ADCAB09
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 19:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389794AbfJCRQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 13:16:53 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39905 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390569AbfJCQXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 12:23:33 -0400
Received: by mail-ed1-f68.google.com with SMTP id a15so3077634edt.6;
        Thu, 03 Oct 2019 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ziG5nQu3xPwJ88X/LZnL5pMrIpk4xw9VvyMbz8MQsEI=;
        b=fpxiUa563sqwJxlPjEOcPMPQdDUdznpeUznfXE/xQIhBee3RpywOZqk9RAeDW9Ajfh
         8uVC4M7k/c838eY5QG17PMfwiK4f+s3+IthwdsafIluDZkNiXhni+Zm8nUInhripCcMm
         hV8qFZTLQePOm4nOE8+Xu05x0RcIwaP530Dmr5t0hRzxtL+F3DD8ZFb/TVv/9GfVKkAK
         xeZTs69UNOYpzikIClqyjf9NK5YzH23jpf0y/Xi1q8icvzYBPUVL4kZihjhjn6o7G4IV
         kf1ud8T5z1cCXIKUFr+LHzjIZg0rYBHq5AJiJoLyipV4ASm4vJXaC2YysqxuA6IuTi/D
         gN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ziG5nQu3xPwJ88X/LZnL5pMrIpk4xw9VvyMbz8MQsEI=;
        b=GzgHSLq7r4gl2fu897Nvzsed4zZrkX0jYWf5QXePNApCh6pFYIPgxYuZmnTtT7Id9o
         aZtI4XnG03CAZ2BWFmYhMMS+L05UYOiNiZw3hMDDqsk2kW6s+ikMJyn0yB9Yw3cZD068
         rHDIBIcV1gU9EeA0+Tap/mkzN6BNymX86mhutp2sQrBasiI/jzdGniWb60x3/c2OXx0J
         7arMHtvh/nWmkv9v0mxSJADbOJrd7K+TqBUghpkLMYhTOJTvT1B2Yq1O20M5FlRhvYom
         9a8NbCeKLEdbCj06DzXRPEQKP5xfh0afq8ddnekiwGY0bXkhsRlBmXB44zJiwVner6b4
         I/Mw==
X-Gm-Message-State: APjAAAVcaDHCD45L9ajJbOZX9ZnbfEhJE/fYzm4eVa1d8ycpvDJrjKKS
        7nsZCxKeguQ2iYR7C4BoRbI=
X-Google-Smtp-Source: APXvYqykHTQaML6sqsg8BxBtjQGr8gUpDoprCG7qt8I1pR9ipgNcQLUR4cUehkL63L5ZZelA3Nb1KQ==
X-Received: by 2002:a17:906:255b:: with SMTP id j27mr8481324ejb.96.1570119810698;
        Thu, 03 Oct 2019 09:23:30 -0700 (PDT)
Received: from Limone ([46.114.33.103])
        by smtp.gmail.com with ESMTPSA id c1sm549687edd.21.2019.10.03.09.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:23:29 -0700 (PDT)
Date:   Thu, 3 Oct 2019 18:23:26 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003162326.GA2727@Limone>
References: <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan>
 <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan>
 <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003130909.01d29b77@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> No, I mean with the first patch you sent to the ML, with the powerup
> hack.

Boot time:

[    4.653257] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
[    4.653259] si2168 1-0067: firmware version: B 4.0.2
[    4.653279] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
[    4.653284] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
...
[    4.694785] si2157 2-0063: found a 'Silicon Labs Si2147-A30'
[    4.694787] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached
[    4.717814] usb 2-1: dvb_usb_v2: 'Logilink VG0022A' successfully initialized and connected
[    4.717880] usbcore: registered new interface driver dvb_usb_af9035

VLC time:

[  175.490609] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
[  176.746585] si2168 1-0067: firmware version: B 4.0.25
[  176.781570] si2157 2-0063: firmware version: \xff.\xff.255

g

