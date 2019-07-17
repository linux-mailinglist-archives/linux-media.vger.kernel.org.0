Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66656BC31
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 14:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfGQMVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 08:21:22 -0400
Received: from jpvw.nl ([80.127.100.2]:39230 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfGQMVW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 08:21:22 -0400
Received: from localhost ([::1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hnivu-0000ZU-DQ; Wed, 17 Jul 2019 14:21:18 +0200
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     James Hutchinson <jahutchinson99@googlemail.com>,
        linux-media@vger.kernel.org, crazycat69@narod.ru,
        mchehab@s-opensource.com
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
From:   JP <jp@jpvw.nl>
Message-ID: <9b8c421b-7329-f8a2-67da-1bd58cca2ece@jpvw.nl>
Date:   Wed, 17 Jul 2019 14:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James,

I have T230 and T230C (v2) and with both sticks I see invalid
checksum errors. My buest guess is that they come from bad
power supply decoupling on the demodulator chip.

The fact that you only see errors with this commit can then be
explained as a timing problem that exists because of this bad
decoupling.

Cheers,
Jan Pieter.

On 7/17/19 9:44 AM, James Hutchinson wrote:
> (trying again in plain text)...
>
> I'm encountering invalid checksum errors randomly in tvheadend with my
> MyGica T230 DVB-T2 tuner, straight after upgrading from Debian Stretch
> (kernel 4.9.168) to Buster (kernel 4.19.37).
>
> For example
>
> 2019-06-29 16:32:27.259 [   INFO]:subscription: 004B: "scan"
> subscribing to mux "618.167MHz", weight: 6, adapter: "Silicon Labs
> Si2168 #0 : DVB-T #0", network: "Freeview", service: "Raw PID
> Subscription"
> 2019-06-29 16:32:27.769 [WARNING]:tbl-eit: uk_freeview: 618.167MHz in
> Freeview: invalid checksum (len 1558, errors 1)
> 2019-06-29 16:32:27.770 [WARNING]:tbl-base: pat: 618.167MHz in
> Freeview: invalid checksum (len 136, errors 1)
> 2019-06-29 16:32:27.967 [WARNING]:tbl-base: sdt: 618.167MHz in
> Freeview: invalid checksum (len 971, errors 1)
> 2019-06-29 16:32:28.462 [WARNING]:tbl-base: pmt: 618.167MHz in
> Freeview: invalid checksum (len 60, errors 1)
> 2019-06-29 16:32:28.463 [WARNING]:tbl-base: pmt: 618.167MHz in
> Freeview: invalid checksum (len 46, errors 1)
> 2019-06-29 16:32:28.637 [WARNING]:tbl-base: pmt: 618.167MHz in
> Freeview: invalid checksum (len 38, errors 1)
> 2019-06-29 16:32:32.258 [   INFO]:mpegts: 618.167MHz in Freeview scan complete
> 2019-06-29 16:32:32.258 [   INFO]:subscription: 004B: "scan" unsubscribing
> 2019-06-29 16:32:32.259 [   INFO]:mpegts: 642MHz in Freeview - tuning
> on Silicon Labs Si2168 #0 : DVB-T #0
> 2019-06-29 16:32:32.259 [   INFO]:subscription: 004E: "scan"
> subscribing to mux "642MHz", weight: 6, adapter: "Silicon Labs Si2168
> #0 : DVB-T #0", network: "Freeview", service: "Raw PID Subscription"
> 2019-06-29 16:32:41.179 [   INFO]:mpegts: 642MHz in Freeview scan complete
> 2019-06-29 16:32:41.179 [   INFO]:subscription: 004E: "scan" unsubscribing
> 2019-06-29 16:32:41.180 [   INFO]:mpegts: 602MHz in Freeview - tuning
> on Silicon Labs Si2168 #0 : DVB-T #0
> 2019-06-29 16:32:41.180 [   INFO]:subscription: 0052: "scan"
> subscribing to mux "602MHz", weight: 6, adapter: "Silicon Labs Si2168
> #0 : DVB-T #0", network: "Freeview", service: "Raw PID Subscription"
> 2019-06-29 16:32:41.835 [WARNING]:tbl-eit: uk_freeview: 602MHz in
> Freeview: invalid checksum (len 320, errors 1)
> 2019-06-29 16:32:42.109 [WARNING]:tbl-base: sdt: 602MHz in Freeview:
> invalid checksum (len 322, errors 1)
> 2019-06-29 16:32:42.314 [WARNING]:tbl-base: pmt: 602MHz in Freeview:
> invalid checksum (len 84, errors 1)
> 2019-06-29 16:32:46.180 [   INFO]:mpegts: 602MHz in Freeview scan complete
> 2019-06-29 16:32:46.180 [   INFO]:subscription: 0052: "scan" unsubscribing
>
> The issue is not specific to particular muxes, and happens entirely at
> random. If I retune then the same mux will scan without issue. It also
> causes data corruption when streaming with continuity counter errors
> in the tvh log; again retuning often resolves the problem, but i never
> had any such issues with kernel v4.9.x.
>
> Heres the output of lsusb to confirm my hardware id:
> 0572:c688 Conexant Systems (Rockwell), Inc. Geniatech T230 DVB-T2 TV Stick
>
> I've been testing various kernel versions in-between 4.9->4.19 and
> quickly found that the issue was introduced somewhere between
> 4.9->4.10.
>
> I therefore performed a (lengthy) git bisect to find out which of the
> 14,248 commits during the v4.10 development cycle introduced this
> regression.
>
> I have tracked this regression down to the following commit:
> 5fa8815: [media] dvb-usb-cxusb: Geniatech T230 - resync TS FIFO after lock
>
> Indeed, if I revert that commit on an upto-date kernel, I now have a
> stable MyGica T230 tuner once more.
>
> Please note that i've tried the latest media_build drivers and have
> also the 5.2 kernel; both of which have the issue, and both of which
> can be fixed by reverting 5fa8815.
>
> Regards,
> James
>

