Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 891226B772
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 09:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfGQHop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 03:44:45 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36595 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGQHop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 03:44:45 -0400
Received: by mail-ua1-f68.google.com with SMTP id v20so9282222uao.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yOzo3wne74UhkVxcx9Ez36aOQMVaqdSd7GIndeezzGs=;
        b=Ramaan20IZ5XjnPD2cEijzAJecJAgw/YYpve0r+bG/cYS7tXbH9V807btIBixwMFH+
         9kAtkaM5nSn55VzPx6BCBLmij/68CKJuetuv0yKthOgmneXmzZJUPGk9tYOesq5O/8Zf
         xdinbVCDcFYGti/mDQqx0+KEwqc343FIrvNngfvLkSD17fL2DFTPEodLJMuYb7BIwD1D
         KENqAWbHHnlTujThFs4JlMcamTWOZAhpYKC+P1w60yUKfwxjl8QKbHalmUA1iSlTgXnl
         ar0BQ582woJyAmjA36jSUsoQ2zJln25Jfv1RnL/9Z2BsZvONtxbEGt3SHfM9HqKDvVMX
         /rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yOzo3wne74UhkVxcx9Ez36aOQMVaqdSd7GIndeezzGs=;
        b=R8RJ5poY/6w6DyvUg5efcHmOWvk/aC3LhUlVWxBcCwmBT6L81WzOW97Zqbqm7pzPnx
         DhBO7i9bDgoYR3SI9axL5tWo3VajbSb+jV4ggwy0KG+RiIM+FfjpvNjllScGtqSAADAF
         GSX+2YD0vVeCqT9OC+9kk/FQsGP9VSekETPHwQX/q0VKGLeiCYACJl+/VVK3VvX2YuOP
         CZ7h7fbcsFk1phEia09CLGJbj6F6bCAD2svtULFl1MjiXH/52ZIPKK1Ajw8tZTuhIwnz
         eoVdFWcD7EQovmud+3yR1e+XxsDrqbfXnCEXLEcSv2Ux4YyNs60G44hGQ2NPSjGsx/pw
         fyMw==
X-Gm-Message-State: APjAAAXPvthS7u1X0RkTOfOvsSmILa+9JCHxF6MPGaAQTATknkyq9dDg
        fyIA95TmQb9EKYK3sNaYuvz99+tiMK8TxYZCSBxQN5+8HLw=
X-Google-Smtp-Source: APXvYqy9O7BQDhR/1jxtuBu+0mMhw5hpCxoWmXxb+xnnnIDOmG3JzdLyGZXimVYB2C2XhM7rlybCfiznF10rA8eX1iU=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr9932945uak.71.1563349483664;
 Wed, 17 Jul 2019 00:44:43 -0700 (PDT)
MIME-Version: 1.0
From:   James Hutchinson <jahutchinson99@googlemail.com>
Date:   Wed, 17 Jul 2019 08:44:33 +0100
Message-ID: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
Subject: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     linux-media@vger.kernel.org, crazycat69@narod.ru,
        mchehab@s-opensource.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(trying again in plain text)...

I'm encountering invalid checksum errors randomly in tvheadend with my
MyGica T230 DVB-T2 tuner, straight after upgrading from Debian Stretch
(kernel 4.9.168) to Buster (kernel 4.19.37).

For example

2019-06-29 16:32:27.259 [   INFO]:subscription: 004B: "scan"
subscribing to mux "618.167MHz", weight: 6, adapter: "Silicon Labs
Si2168 #0 : DVB-T #0", network: "Freeview", service: "Raw PID
Subscription"
2019-06-29 16:32:27.769 [WARNING]:tbl-eit: uk_freeview: 618.167MHz in
Freeview: invalid checksum (len 1558, errors 1)
2019-06-29 16:32:27.770 [WARNING]:tbl-base: pat: 618.167MHz in
Freeview: invalid checksum (len 136, errors 1)
2019-06-29 16:32:27.967 [WARNING]:tbl-base: sdt: 618.167MHz in
Freeview: invalid checksum (len 971, errors 1)
2019-06-29 16:32:28.462 [WARNING]:tbl-base: pmt: 618.167MHz in
Freeview: invalid checksum (len 60, errors 1)
2019-06-29 16:32:28.463 [WARNING]:tbl-base: pmt: 618.167MHz in
Freeview: invalid checksum (len 46, errors 1)
2019-06-29 16:32:28.637 [WARNING]:tbl-base: pmt: 618.167MHz in
Freeview: invalid checksum (len 38, errors 1)
2019-06-29 16:32:32.258 [   INFO]:mpegts: 618.167MHz in Freeview scan complete
2019-06-29 16:32:32.258 [   INFO]:subscription: 004B: "scan" unsubscribing
2019-06-29 16:32:32.259 [   INFO]:mpegts: 642MHz in Freeview - tuning
on Silicon Labs Si2168 #0 : DVB-T #0
2019-06-29 16:32:32.259 [   INFO]:subscription: 004E: "scan"
subscribing to mux "642MHz", weight: 6, adapter: "Silicon Labs Si2168
#0 : DVB-T #0", network: "Freeview", service: "Raw PID Subscription"
2019-06-29 16:32:41.179 [   INFO]:mpegts: 642MHz in Freeview scan complete
2019-06-29 16:32:41.179 [   INFO]:subscription: 004E: "scan" unsubscribing
2019-06-29 16:32:41.180 [   INFO]:mpegts: 602MHz in Freeview - tuning
on Silicon Labs Si2168 #0 : DVB-T #0
2019-06-29 16:32:41.180 [   INFO]:subscription: 0052: "scan"
subscribing to mux "602MHz", weight: 6, adapter: "Silicon Labs Si2168
#0 : DVB-T #0", network: "Freeview", service: "Raw PID Subscription"
2019-06-29 16:32:41.835 [WARNING]:tbl-eit: uk_freeview: 602MHz in
Freeview: invalid checksum (len 320, errors 1)
2019-06-29 16:32:42.109 [WARNING]:tbl-base: sdt: 602MHz in Freeview:
invalid checksum (len 322, errors 1)
2019-06-29 16:32:42.314 [WARNING]:tbl-base: pmt: 602MHz in Freeview:
invalid checksum (len 84, errors 1)
2019-06-29 16:32:46.180 [   INFO]:mpegts: 602MHz in Freeview scan complete
2019-06-29 16:32:46.180 [   INFO]:subscription: 0052: "scan" unsubscribing

The issue is not specific to particular muxes, and happens entirely at
random. If I retune then the same mux will scan without issue. It also
causes data corruption when streaming with continuity counter errors
in the tvh log; again retuning often resolves the problem, but i never
had any such issues with kernel v4.9.x.

Heres the output of lsusb to confirm my hardware id:
0572:c688 Conexant Systems (Rockwell), Inc. Geniatech T230 DVB-T2 TV Stick

I've been testing various kernel versions in-between 4.9->4.19 and
quickly found that the issue was introduced somewhere between
4.9->4.10.

I therefore performed a (lengthy) git bisect to find out which of the
14,248 commits during the v4.10 development cycle introduced this
regression.

I have tracked this regression down to the following commit:
5fa8815: [media] dvb-usb-cxusb: Geniatech T230 - resync TS FIFO after lock

Indeed, if I revert that commit on an upto-date kernel, I now have a
stable MyGica T230 tuner once more.

Please note that i've tried the latest media_build drivers and have
also the 5.2 kernel; both of which have the issue, and both of which
can be fixed by reverting 5fa8815.

Regards,
James
