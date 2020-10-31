Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C2A2A188D
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgJaP1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:27:49 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39790 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgJaP1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:27:48 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 77D333A0991
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2020 15:23:58 +0000 (UTC)
Received: from [81.187.57.10] (vaio.adsb.co.uk [81.187.57.10])
        (Authenticated sender: mailsend@adsb.me.uk)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4F424240006
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2020 15:23:37 +0000 (UTC)
To:     linux-media@vger.kernel.org
From:   Andrew Benham <andrew.benham@adsb.co.uk>
Subject: [PATCH] dvb-apps: Add option for UK channel numbering in ZAP format
Message-ID: <06ff134b-4727-ba14-e614-934a296ea210@adsb.co.uk>
Date:   Sat, 31 Oct 2020 15:23:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is already a "-u" option to output UK channel numbering in VDR
format.  Patch accepts the option for ZAP format too.

In ZAP format, channel names will have "<channel_number>-" prepended,
allowing channels to be sorted by number order.


diff -r 3d43b280298c util/scan/dump-zap.c
--- a/util/scan/dump-zap.c      Fri Mar 21 20:26:36 2014 +0100
+++ b/util/scan/dump-zap.c      Sat Oct 31 15:12:40 2020 +0000T
@@ -116,8 +116,12 @@
                                  int sat_number,
                                  uint16_t video_pid,
                                  uint16_t *audio_pid,
-                                uint16_t service_id)
+                                uint16_t service_id,
+                                int dump_channum,
+                                int channel_num)
  {
+       if ((dump_channum == 1) && (channel_num > 0))
+               fprintf(f, "%i-", channel_num);
         fprintf (f, "%s:", service_name);
         zap_dump_dvb_parameters (f, type, p, polarity, sat_number);
         fprintf (f, ":%i:%i:%i", video_pid, audio_pid[0], service_id);
diff -r 3d43b280298c util/scan/dump-zap.h
--- a/util/scan/dump-zap.h      Fri Mar 21 20:26:36 2014 +0100
+++ b/util/scan/dump-zap.h      Sat Oct 31 15:12:40 2020 +0000
@@ -14,6 +14,8 @@
                                  char polarity, int sat,
                                  uint16_t video_pid,
                                  uint16_t *audio_pid,
-                                uint16_t service_id);
+                                uint16_t service_id,
+                                int dump_channum,
+                                int channel_num);

  #endif
diff -r 3d43b280298c util/scan/scan.c
--- a/util/scan/scan.c  Fri Mar 21 20:26:36 2014 +0100
+++ b/util/scan/scan.c  Sat Oct 31 15:12:40 2020 +0000
@@ -2477,7 +2477,9 @@
                                                     sat_number(t),
                                                     s->video_pid,
                                                     s->audio_pid,
-                                                   s->service_id);
+                                                   s->service_id,
+                                                   vdr_dump_channum,
+                                                   s->channel_num);
                           default:
                                break;
                           }
@@ -2545,7 +2547,7 @@
         "               Vdr version 1.3.x and up implies -p.\n"
         "       -l lnb-type (DVB-S Only) (use -l help to print types) 
or \n"
         "       -l low[,high[,switch]] in Mhz\n"
-       "       -u      UK DVB-T Freeview channel numbering for VDR\n\n"
+       "       -u      UK DVB-T Freeview channel numbering\n\n"
         "       -P do not use ATSC PSIP tables for scanning\n"
         "           (but only PAT and PMT) (applies for ATSC only)\n"
         "       -A N    check for ATSC 1=Terrestrial [default], 2=Cable 
or 3=both\n"


-- 
Andrew Benham     Southgate, London N14, United Kingdom

The gates in my computer are AND OR and NOT, not "Bill"
