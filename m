Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA4C1A768C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437131AbgDNIvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728251AbgDNIvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4EA52076C;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=/nMy/VTPLC8KdPETiP+MobS13F2QeC4I/2mqQFzK7Fc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mVTfi2uVXEQSidwoU+TwlBhUs6Hwj7aKd0wGXvHRMC4JBrRkLr4XZrCOk7j4sNpCk
         DMj12715Y2CcR2H5bu1nDeXjXy+vOa8X/SCpn3rmn2uhD/R0AP1SIJvdawDpPPgdJU
         IAzoKo8MpC618GX3aha1EtidIQxlB0QQ4WvowqN8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHe-002wyu-TX; Tue, 14 Apr 2020 10:51:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 03/19] media: docs: dvb_intro.rst: update its contents
Date:   Tue, 14 Apr 2020 10:50:49 +0200
Message-Id: <f0aca05ee3427f1fac38e778504e2165ebdcdb86.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The content there is somewhat outdated. Update to reflect
the current status.

While here, remove extra spaces, as we won't be preserving
left margin alinment on this document.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/dvb_intro.rst | 736 ++++++++++++++----
 1 file changed, 575 insertions(+), 161 deletions(-)

diff --git a/Documentation/admin-guide/media/dvb_intro.rst b/Documentation/admin-guide/media/dvb_intro.rst
index af9516f2cb60..44eac9b3be6c 100644
--- a/Documentation/admin-guide/media/dvb_intro.rst
+++ b/Documentation/admin-guide/media/dvb_intro.rst
@@ -4,199 +4,613 @@
 Using the Digital TV Framework
 ==============================
 
-February 14th 2006
-
 Introduction
 ~~~~~~~~~~~~
 
-.. note::
-
-   This documentation is outdated. Please check at the DVB wiki
-   at https://linuxtv.org/wiki for more updated info.
-
-   There's a section there specific for Avermedia boards at:
-   https://linuxtv.org/wiki/index.php/AVerMedia
-
-
-Assumptions and Introduction
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-It  is assumed that the reader understands the basic structure
-of  the Linux Kernel DVB drivers and the general principles of
-Digital TV.
-
-One  significant difference between Digital TV and Analogue TV
-that  the  unwary  (like  myself)  should  consider  is  that,
-although  the  component  structure  of budget DVB-T cards are
-substantially  similar  to Analogue TV cards, they function in
-substantially different ways.
-
-The  purpose  of  an  Analogue TV is to receive and display an
-Analogue  Television  signal. An Analogue TV signal (otherwise
-known  as  composite  video)  is  an  analogue  encoding  of a
-sequence  of  image frames (25 per second) rasterised using an
-interlacing   technique.   Interlacing  takes  two  fields  to
-represent  one  frame.  Computers today are at their best when
-dealing  with  digital  signals,  not  analogue  signals and a
-composite  video signal is about as far removed from a digital
-data stream as you can get. Therefore, an Analogue TV card for
-a PC has the following purpose:
+One significant difference between Digital TV and Analogue TV that the
+unwary (like myself) should consider is that, although the component
+structure of DVB-T cards are substantially similar to Analogue TV cards,
+they function in substantially different ways.
+
+The purpose of an Analogue TV is to receive and display an Analogue
+Television signal. An Analogue TV signal (otherwise known as composite
+video) is an analogue encoding of a sequence of image frames (25 frames
+per second in Europe) rasterised using an interlacing technique.
+Interlacing takes two fields to represent one frame. Therefore, an
+Analogue TV card for a PC has the following purpose:
 
 * Tune the receiver to receive a broadcast signal
 * demodulate the broadcast signal
-* demultiplex  the  analogue video signal and analogue audio
-  signal. **NOTE:** some countries employ a digital audio signal
-  embedded  within the modulated composite analogue signal -
-  NICAM.)
-* digitize  the analogue video signal and make the resulting
-  datastream available to the data bus.
-
-The  digital  datastream from an Analogue TV card is generated
-by  circuitry on the card and is often presented uncompressed.
-For  a PAL TV signal encoded at a resolution of 768x576 24-bit
-color pixels over 25 frames per second - a fair amount of data
-is  generated and must be processed by the PC before it can be
-displayed  on the video monitor screen. Some Analogue TV cards
-for  PCs  have  onboard  MPEG2  encoders  which permit the raw
-digital  data  stream  to be presented to the PC in an encoded
-and  compressed  form  -  similar  to the form that is used in
-Digital TV.
-
-The  purpose of a simple budget digital TV card (DVB-T,C or S)
-is to simply:
-
-* Tune the received to receive a broadcast signal.
-* Extract  the encoded digital datastream from the broadcast
+* demultiplex the analogue video signal and analogue audio
   signal.
-* Make  the  encoded digital datastream (MPEG2) available to
-  the data bus.
-
-The  significant  difference between the two is that the tuner
-on  the analogue TV card spits out an Analogue signal, whereas
-the  tuner  on  the  digital  TV  card  spits out a compressed
-encoded   digital   datastream.   As  the  signal  is  already
-digitised,  it  is  trivial  to pass this datastream to the PC
-databus  with  minimal  additional processing and then extract
-the  digital  video  and audio datastreams passing them to the
-appropriate software or hardware for decoding and viewing.
 
+  .. note::
+
+     some countries employ a digital audio signal
+     embedded within the modulated composite analogue signal -
+     using NICAM signaling.)
+
+* digitize the analogue video signal and make the resulting datastream
+  available to the data bus.
+
+The digital datastream from an Analogue TV card is generated by
+circuitry on the card and is often presented uncompressed. For a PAL TV
+signal encoded at a resolution of 768x576 24-bit color pixels over 25
+frames per second - a fair amount of data is generated and must be
+processed by the PC before it can be displayed on the video monitor
+screen. Some Analogue TV cards for PCs have onboard MPEG2 encoders which
+permit the raw digital data stream to be presented to the PC in an
+encoded and compressed form - similar to the form that is used in
+Digital TV.
+
+The purpose of a simple budget digital TV card (DVB-T,C or S) is to
+simply:
+
+* Tune the received to receive a broadcast signal. * Extract the encoded
+  digital datastream from the broadcast signal.
+* Make the encoded digital datastream (MPEG2) available to the data bus.
+
+The significant difference between the two is that the tuner on the
+analogue TV card spits out an Analogue signal, whereas the tuner on the
+digital TV card spits out a compressed encoded digital datastream. As
+the signal is already digitised, it is trivial to pass this datastream
+to the PC databus with minimal additional processing and then extract
+the digital video and audio datastreams passing them to the appropriate
+software or hardware for decoding and viewing.
 
 Getting the card going
 ~~~~~~~~~~~~~~~~~~~~~~
 
-In order to fire up the card, it is necessary to load a number
-of modules from the DVB driver set. Prior to this it will have
-been  necessary to download these drivers from the linuxtv CVS
-server and compile them successfully.
+The Device Driver API for DVB under Linux will the following
+device nodes via the devfs filesystem:
 
-Depending on the card's feature set, the Device Driver API for
-DVB under Linux will expose some of the following device files
-in the /dev tree:
-
-* /dev/dvb/adapter0/audio0
-* /dev/dvb/adapter0/ca0
 * /dev/dvb/adapter0/demux0
 * /dev/dvb/adapter0/dvr0
 * /dev/dvb/adapter0/frontend0
+
+The ``/dev/dvb/adapter0/dvr0`` device node is used to read the MPEG2
+Data Stream and the ``/dev/dvb/adapter0/frontend0`` device node is used
+to tune the frontend tuner module. The ``/dev/dvb/adapter0/demux0`` is
+used to control what programs will be received.
+
+Depending on the card's feature set, the Device Driver API could also
+expose other device nodes:
+
+* /dev/dvb/adapter0/ca0
+* /dev/dvb/adapter0/audio0
 * /dev/dvb/adapter0/net0
 * /dev/dvb/adapter0/osd0
 * /dev/dvb/adapter0/video0
 
-The  primary  device  nodes that we are interested in (at this
-stage) for the Avermedia DVB-T are:
+The ``/dev/dvb/adapter0/ca0`` is used to decode encrypted channels. The
+other device nodes are found only on devices that use the av7110
+driver, with is now obsoleted, together with the extra API whose such
+devices use.
 
-* /dev/dvb/adapter0/dvr0
-* /dev/dvb/adapter0/frontend0
+Receiving a digital TV channel
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The dvr0 device node is used to read the MPEG2 Data Stream and
-the frontend0 node is used to tune the frontend tuner module.
+This section attempts to explain how it works and how this affects the
+configuration of a Digital TV card.
 
+On this example, we're considering tuning into DVB-T channels in
+Australia, at the Melbourne region.
 
-Receiving DVB-T in Australia
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-I  have  no  experience of DVB-T in other countries other than
-Australia,  so  I will attempt to explain how it works here in
-Melbourne  and how this affects the configuration of the DVB-T
-card.
-
-The  Digital  Broadcasting  Australia  website has a Reception
-locatortool which provides information on transponder channels
-and  frequencies.  My  local  transmitter  happens to be Mount
-Dandenong.
-
-The frequencies broadcast by Mount Dandenong are:
+The frequencies broadcast by Mount Dandenong transmitters are,
+currently:
 
 Table 1. Transponder Frequencies Mount Dandenong, Vic, Aus.
 
-=========== ======= ===========
-Broadcaster Channel Frequency
-=========== ======= ===========
-ABC         VHF 12  226.5 MHz
-TEN         VHF 11  219.5 MHz
-NINE        VHF 8   191.625 MHz
-SEVEN       VHF 6   177.5 MHz
-SBS         UHF 29  536.5 MHz
-=========== ======= ===========
+===========	===========
+Broadcaster	Frequency
+===========	===========
+Seven		177.500 Mhz
+SBS		184.500 Mhz
+Nine		191.625 Mhz
+Ten		219.500 Mhz
+ABC		226.500 Mhz
+Channel 31	557.625 Mhz
+===========	===========
 
-The Scan utility has a set of compiled-in defaults for various
-countries and regions, but if they do not suit, or if you have
-a pre-compiled scan binary, you can specify a data file on the
-command  line which contains the transponder frequencies. Here
-is a sample file for the above channel transponders:
+The digital TV Scan utilities (like dvbv5-scan) have use a set of
+compiled-in defaults for various countries and regions. Those are
+currently provided as a separate package, called dtv-scan-tables. It's
+git tree is located at LinuxTV.org:
 
-::
+    https://git.linuxtv.org/dtv-scan-tables.git/
+
+If none of the tables there suit, you can specify a data file on the
+command line which contains the transponder frequencies. Here is a
+sample file for the above channel transponders, in the old "channel"
+format::
 
 	# Data file for DVB scan program
 	#
 	# C Frequency SymbolRate FEC QAM
 	# S Frequency Polarisation SymbolRate FEC
 	# T Frequency Bandwidth FEC FEC2 QAM Mode Guard Hier
-	T 226500000 7MHz 2/3 NONE QAM64 8k 1/8 NONE
-	T 191625000 7MHz 2/3 NONE QAM64 8k 1/8 NONE
-	T 219500000 7MHz 2/3 NONE QAM64 8k 1/8 NONE
-	T 177500000 7MHz 2/3 NONE QAM64 8k 1/8 NONE
-	T 536500000 7MHz 2/3 NONE QAM64 8k 1/8 NONE
-
-The   defaults   for   the  transponder  frequency  and  other
-modulation parameters were obtained from www.dba.org.au.
-
-When  Scan  runs, it will output channels.conf information for
-any  channel's transponders which the card's frontend can lock
-onto.  (i.e.  any  whose  signal  is  strong  enough  at  your
-antenna).
-
-Here's my channels.conf file for anyone who's interested:
-
-::
-
-	ABC HDTV:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:2307:0:560
-	ABC TV Melbourne:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:561
-	ABC TV 2:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:562
-	ABC TV 3:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:563
-	ABC TV 4:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:564
-	ABC DiG Radio:226500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_3_4:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:0:2311:566
-	TEN Digital:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1585
-	TEN Digital 1:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1586
-	TEN Digital 2:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1587
-	TEN Digital 3:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1588
-	TEN Digital:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1589
-	TEN Digital 4:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1590
-	TEN Digital:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1591
-	TEN HD:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:514:0:1592
-	TEN Digital:219500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:650:1593
-	Nine Digital:191625000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:513:660:1072
-	Nine Digital HD:191625000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:512:0:1073
-	Nine Guide:191625000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_3_4:FEC_1_2:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_16:HIERARCHY_NONE:514:670:1074
-	7 Digital:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:769:770:1328
-	7 Digital 1:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:769:770:1329
-	7 Digital 2:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:769:770:1330
-	7 Digital 3:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:769:770:1331
-	7 HD Digital:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:833:834:1332
-	7 Program Guide:177500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:865:866:1334
-	SBS HD:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:102:103:784
-	SBS DIGITAL 1:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:161:81:785
-	SBS DIGITAL 2:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:162:83:786
-	SBS EPG:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:163:85:787
-	SBS RADIO 1:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:0:201:798
-	SBS RADIO 2:536500000:INVERSION_OFF:BANDWIDTH_7_MHZ:FEC_2_3:FEC_2_3:QAM_64:TRANSMISSION_MODE_8K:GUARD_INTERVAL_1_8:HIERARCHY_NONE:0:202:799
+
+	T 177500000 7MHz AUTO AUTO QAM64 8k 1/16 NONE
+	T 184500000 7MHz AUTO AUTO QAM64 8k 1/8 NONE
+	T 191625000 7MHz AUTO AUTO QAM64 8k 1/16 NONE
+	T 219500000 7MHz AUTO AUTO QAM64 8k 1/16 NONE
+	T 226500000 7MHz AUTO AUTO QAM64 8k 1/16 NONE
+	T 557625000 7MHz AUTO AUTO QPSK 8k 1/16 NONE
+
+Nowadays, we prefer to use a newer format, with is more verbose and easier
+to understand. With the new format, the "Seven" channel transponder's
+data is represented by::
+
+	[Seven]
+		DELIVERY_SYSTEM = DVBT
+		FREQUENCY = 177500000
+		BANDWIDTH_HZ = 7000000
+		CODE_RATE_HP = AUTO
+		CODE_RATE_LP = AUTO
+		MODULATION = QAM/64
+		TRANSMISSION_MODE = 8K
+		GUARD_INTERVAL = 1/16
+		HIERARCHY = NONE
+		INVERSION = AUTO
+
+For an updated version of the complete table, please see:
+
+    https://git.linuxtv.org/dtv-scan-tables.git/tree/dvb-t/au-Melbourne
+
+When the Digital TV scanning utility runs, it will output a file
+containing the information for all the audio and video programs that
+exists into each channel's transponders which the card's frontend can
+lock onto. (i.e. any whose signal is strong enough at your antenna).
+
+Here's the output of the dvbv5 tools from a channel scan took from
+Melburne::
+
+    [ABC HDTV]
+	    SERVICE_ID = 560
+	    VIDEO_PID = 2307
+	    AUDIO_PID = 0
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [ABC TV Melbourne]
+	    SERVICE_ID = 561
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [ABC TV 2]
+	    SERVICE_ID = 562
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [ABC TV 3]
+	    SERVICE_ID = 563
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [ABC TV 4]
+	    SERVICE_ID = 564
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [ABC DiG Radio]
+	    SERVICE_ID = 566
+	    VIDEO_PID = 0
+	    AUDIO_PID = 2311
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 226500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 3/4
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital]
+	    SERVICE_ID = 1585
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital 1]
+	    SERVICE_ID = 1586
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital 2]
+	    SERVICE_ID = 1587
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital 3]
+	    SERVICE_ID = 1588
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital]
+	    SERVICE_ID = 1589
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital 4]
+	    SERVICE_ID = 1590
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital]
+	    SERVICE_ID = 1591
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN HD]
+	    SERVICE_ID = 1592
+	    VIDEO_PID = 514
+	    AUDIO_PID = 0
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [TEN Digital]
+	    SERVICE_ID = 1593
+	    VIDEO_PID = 512
+	    AUDIO_PID = 650
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 219500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [Nine Digital]
+	    SERVICE_ID = 1072
+	    VIDEO_PID = 513
+	    AUDIO_PID = 660
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 191625000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [Nine Digital HD]
+	    SERVICE_ID = 1073
+	    VIDEO_PID = 512
+	    AUDIO_PID = 0
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 191625000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [Nine Guide]
+	    SERVICE_ID = 1074
+	    VIDEO_PID = 514
+	    AUDIO_PID = 670
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 191625000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 3/4
+	    CODE_RATE_LP = 1/2
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/16
+	    HIERARCHY = NONE
+
+    [7 Digital]
+	    SERVICE_ID = 1328
+	    VIDEO_PID = 769
+	    AUDIO_PID = 770
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [7 Digital 1]
+	    SERVICE_ID = 1329
+	    VIDEO_PID = 769
+	    AUDIO_PID = 770
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [7 Digital 2]
+	    SERVICE_ID = 1330
+	    VIDEO_PID = 769
+	    AUDIO_PID = 770
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [7 Digital 3]
+	    SERVICE_ID = 1331
+	    VIDEO_PID = 769
+	    AUDIO_PID = 770
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [7 HD Digital]
+	    SERVICE_ID = 1332
+	    VIDEO_PID = 833
+	    AUDIO_PID = 834
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [7 Program Guide]
+	    SERVICE_ID = 1334
+	    VIDEO_PID = 865
+	    AUDIO_PID = 866
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 177500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS HD]
+	    SERVICE_ID = 784
+	    VIDEO_PID = 102
+	    AUDIO_PID = 103
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS DIGITAL 1]
+	    SERVICE_ID = 785
+	    VIDEO_PID = 161
+	    AUDIO_PID = 81
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS DIGITAL 2]
+	    SERVICE_ID = 786
+	    VIDEO_PID = 162
+	    AUDIO_PID = 83
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS EPG]
+	    SERVICE_ID = 787
+	    VIDEO_PID = 163
+	    AUDIO_PID = 85
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS RADIO 1]
+	    SERVICE_ID = 798
+	    VIDEO_PID = 0
+	    AUDIO_PID = 201
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
+
+    [SBS RADIO 2]
+	    SERVICE_ID = 799
+	    VIDEO_PID = 0
+	    AUDIO_PID = 202
+	    DELIVERY_SYSTEM = DVBT
+	    FREQUENCY = 536500000
+	    INVERSION = OFF
+	    BANDWIDTH_HZ = 7000000
+	    CODE_RATE_HP = 2/3
+	    CODE_RATE_LP = 2/3
+	    MODULATION = QAM/64
+	    TRANSMISSION_MODE = 8K
+	    GUARD_INTERVAL = 1/8
+	    HIERARCHY = NONE
-- 
2.25.2

