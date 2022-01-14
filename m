Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0895B48E4F6
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 08:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbiANHnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 02:43:51 -0500
Received: from mout.gmx.net ([212.227.17.21]:36983 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbiANHnu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 02:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642146228;
        bh=CKb50tPS3g13iRTWosxtzECoLE9mNQe1gwtUPG2X/mc=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=Oac9RmXuWOy2BuG2LRAJciPG5slHZjvv/TXYge7FQk435yr/i0cPL0C5hxNTIK7rN
         UxIDFmLE+CmX1tq9++ESVMyqVI2+JMJkAf/IMmLzbai83zNiGE17UwZ/EgzGtf10YH
         yYu9g3D7HixFqSty8JnmSwBETMiXlJOWTmCdmTYo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.111.22] ([91.65.111.22]) by web-mail.gmx.net
 (3c-app-gmx-bap69.server.lan [172.19.172.69]) (via HTTP); Fri, 14 Jan 2022
 08:43:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-1b7c5a66-85d4-4595-a690-0fde965d49b3-1642146228587@3c-app-gmx-bap69>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: dvb: add DVB-C2 and DVB-S2X parameter values
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 14 Jan 2022 08:43:48 +0100
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:iQ319yxWZtYYCibdbVVTiqDP5BcNkvAlUdJeVRrCWtockbrvQfksIwCcsSFzgy6B4w/Pe
 HOIHZkzHf5R7Di80qtKc/3er11x4mXhJqFS8gz5ZgoLv+VTasPiTCuWazQLFdJqZRhzNMuXsptTB
 werbbtU9AQU+2QwDE/tm2jYseFKWgx5gatXU9v6vv8Wvv5A/RQq5rlHcmMrUPkWJ5NKDhN0OZVrG
 j1CuWd+oDjF8MRlPaqOP6vTTMUG6DS7N3WuSlwUeET+n5zN8IZnDP0aD1gLPDRLyXL45UN1VVyzM
 U0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UFh1PZA+bzg=:dkEwmYCPO4/e+2zNdmnnNJ
 Xg4NdbZ5jv/tUa/pUZ5VClOvltPKjoPnGY5qWsUXhi5W5UXekkDwlSFr19bbVc53BBOvw1cDf
 F44j9/KTDB/lnQKPB7SWmVBViNZZckzIYqJoCZe4OHITB0xn0x46emstwtRbi1EWZPqie1d4f
 wx8uEpDhMUPAqWYpay/l29G63ZuhG3GNW8cHCdMbEeEBYqrREgTaevS0dtbxipZ6oeO8PQt8x
 Y4urAYERRo7Vb+RhG7dMmGzU/pMkQK3RKb2DtS3/e8+lEU4lyJzEy9VdFIBP5UWLk/AqtmOUu
 sU0RXbx0fC0TWBDelag91e/PjxoqBDngOk+zngsDLyOfoTyR5S2PFnkRwZDzzNIIvCP8JOIFT
 7u7jdekuFDtS6XZ2q37SGbwYq1M7gKu5ilemW4JF66E6ecyo5tfwBn6gJOusDuX7uNjWTdvAP
 hgNZ9bDJ2p7w8pyp3ddwwLNrbj76r2tS4ML+3hH+D7ATwdfRsXNBuBPzafivtHaQP9fptvzlW
 H9Up+eV2cLuugeC/lRdsw4D2F5GWR90a2rqWI65yu/db2NPyMfnUj27icLce6DEdQT2/foYkK
 ItkyC6x/San9fgVnLqWnjkhaHqaVYhBPtZ+tyWKPqamW6RuVG4Bx/4SEg4oc0JSISgmKnUH4t
 qVO0AOUU8tmYgHVaBfy64cP9L1Dpkkr2z9G6upSWZ4JrBEY0E3DoFG+bvAm8IdCfj8jAQosMo
 oZv5d7xJX4mb5IWqi6et0maDQgzQa4zcJZXE6eNY5YaMdseXf/PY37yX61TC0RrgY068u9f0J
 dUC2PNu
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the DVB frontend parameter enums with additional values specified
by the DVB-C2 (ETSI EN 302 769) and DVB-S2X (ETSI EN 302 307-2)
standards to be ready for frontend drivers for such receivers=2E

While most parameters will be "read-only" due to being autodetected by
the receiver and only being reported back for informational purposes,
the addition of SYS_DVBC2 to the delivery systems enum is required,
because there are DVB-C2 capable receivers which are not capable of
DVB-C/C2 autodetection and thus need this enum value to be explicitly
instructed to search for a DVB-C2 signal=2E

As for DVB-S2X, as that is an extension to DVB-S2, the same delivery
system enum as for DVB-S2 can be used=2E

Add the additional enum values and comments to the documentation=2E

Signed-off-by: Robert Schlabbach <robert_s@gmx=2Enet>
---
 =2E=2E=2E/media/dvb/fe_property_parameters=2Erst      | 25 +++++---
 include/uapi/linux/dvb/frontend=2Eh             | 59 ++++++++++++++++++-
 2 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/fe_property_parameters=
=2Erst b/Documentation/userspace-api/media/dvb/fe_property_parameters=2Erst
index ecd84a8790a2=2E=2E1717a0565fe8 100644
--- a/Documentation/userspace-api/media/dvb/fe_property_parameters=2Erst
+++ b/Documentation/userspace-api/media/dvb/fe_property_parameters=2Erst
@@ -89,16 +89,21 @@ ATSC (version 1)	8-VSB and 16-VSB=2E
 DMTB			4-QAM, 16-QAM, 32-QAM, 64-QAM and 4-QAM-NR=2E
 DVB-C Annex A/C		16-QAM, 32-QAM, 64-QAM and 256-QAM=2E
 DVB-C Annex B		64-QAM=2E
+DVB-C2			QPSK, 16-QAM, 64-QAM, 256-QAM, 1024-QAM and 4096-QAM=2E
 DVB-T			QPSK, 16-QAM and 64-QAM=2E
 DVB-T2			QPSK, 16-QAM, 64-QAM and 256-QAM=2E
 DVB-S			No need to set=2E It supports only QPSK=2E
 DVB-S2			QPSK, 8-PSK, 16-APSK and 32-APSK=2E
+DVB-S2X			8-APSK-L, 16-APSK-L, 32-APSK-L, 64-APSK and 64-APSK-L=2E
 ISDB-T			QPSK, DQPSK, 16-QAM and 64-QAM=2E
 ISDB-S			8-PSK, QPSK and BPSK=2E
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 =2E=2E note::
=20
+   As DVB-S2X specifies extensions to the DVB-S2 standard, the same
+   delivery system enum value is used (SYS_DVBS2)=2E
+
    Please notice that some of the above modulation types may not be
    defined currently at the Kernel=2E The reason is simple: no driver
    needed such definition yet=2E
@@ -854,9 +859,10 @@ The acceptable values are defined by :c:type:`fe_guar=
d_interval`=2E
    #=2E If ``DTV_GUARD_INTERVAL`` is set the ``GUARD_INTERVAL_AUTO`` the
       hardware will try to find the correct guard interval (if capable) a=
nd
       will use TMCC to fill in the missing parameters=2E
-   #=2E Intervals ``GUARD_INTERVAL_1_128``, ``GUARD_INTERVAL_19_128``
-      and ``GUARD_INTERVAL_19_256`` are used only for DVB-T2 at
-      present=2E
+   #=2E Interval ``GUARD_INTERVAL_1_64`` is used only for DVB-C2=2E
+   #=2E Interval ``GUARD_INTERVAL_1_128`` is used for both DVB-C2 and DVB=
_T2=2E
+   #=2E Intervals ``GUARD_INTERVAL_19_128`` and ``GUARD_INTERVAL_19_256``=
 are
+      used only for DVB-T2=2E
    #=2E Intervals ``GUARD_INTERVAL_PN420``, ``GUARD_INTERVAL_PN595`` and
       ``GUARD_INTERVAL_PN945`` are used only for DMTB at the present=2E
       On such standard, only those intervals and ``GUARD_INTERVAL_AUTO``
@@ -916,14 +922,15 @@ The acceptable values are defined by :c:type:`fe_hie=
rarchy`=2E
 DTV_STREAM_ID
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Used on DVB-S2, DVB-T2 and ISDB-S=2E
+Used on DVB-C2, DVB-S2, DVB-T2 and ISDB-S=2E
=20
-DVB-S2, DVB-T2 and ISDB-S support the transmission of several streams on
-a single transport stream=2E This property enables the digital TV driver =
to
-handle substream filtering, when supported by the hardware=2E By default,
-substream filtering is disabled=2E
+DVB-C2, DVB-S2, DVB-T2 and ISDB-S support the transmission of several
+streams on a single transport stream=2E This property enables the digital
+TV driver to handle substream filtering, when supported by the hardware=
=2E
+By default, substream filtering is disabled=2E
=20
-For DVB-S2 and DVB-T2, the valid substream id range is from 0 to 255=2E
+For DVB-C2, DVB-S2 and DVB-T2, the valid substream id range is from 0 to
+255=2E
=20
 For ISDB, the valid substream id range is from 1 to 65535=2E
=20
diff --git a/include/uapi/linux/dvb/frontend=2Eh b/include/uapi/linux/dvb/=
frontend=2Eh
index 4f9b4551c534=2E=2E4fed9e316147 100644
--- a/include/uapi/linux/dvb/frontend=2Eh
+++ b/include/uapi/linux/dvb/frontend=2Eh
@@ -296,6 +296,22 @@ enum fe_spectral_inversion {
  * @FEC_3_5:  Forward Error Correction Code 3/5
  * @FEC_9_10: Forward Error Correction Code 9/10
  * @FEC_2_5:  Forward Error Correction Code 2/5
+ * @FEC_1_3:  Forward Error Correction Code 1/3
+ * @FEC_1_4:  Forward Error Correction Code 1/4
+ * @FEC_5_9:  Forward Error Correction Code 5/9
+ * @FEC_7_9:  Forward Error Correction Code 7/9
+ * @FEC_8_15:  Forward Error Correction Code 8/15
+ * @FEC_11_15: Forward Error Correction Code 11/15
+ * @FEC_13_18: Forward Error Correction Code 13/18
+ * @FEC_9_20:  Forward Error Correction Code 9/20
+ * @FEC_11_20: Forward Error Correction Code 11/20
+ * @FEC_23_36: Forward Error Correction Code 23/36
+ * @FEC_25_36: Forward Error Correction Code 25/36
+ * @FEC_13_45: Forward Error Correction Code 13/45
+ * @FEC_26_45: Forward Error Correction Code 26/45
+ * @FEC_28_45: Forward Error Correction Code 28/45
+ * @FEC_32_45: Forward Error Correction Code 32/45
+ * @FEC_77_90: Forward Error Correction Code 77/90
  *
  * Please note that not all FEC types are supported by a given standard=
=2E
  */
@@ -313,6 +329,22 @@ enum fe_code_rate {
 	FEC_3_5,
 	FEC_9_10,
 	FEC_2_5,
+	FEC_1_3,
+	FEC_1_4,
+	FEC_5_9,
+	FEC_7_9,
+	FEC_8_15,
+	FEC_11_15,
+	FEC_13_18,
+	FEC_9_20,
+	FEC_11_20,
+	FEC_23_36,
+	FEC_25_36,
+	FEC_13_45,
+	FEC_26_45,
+	FEC_28_45,
+	FEC_32_45,
+	FEC_77_90,
 };
=20
 /**
@@ -331,6 +363,13 @@ enum fe_code_rate {
  * @APSK_32:	32-APSK modulation
  * @DQPSK:	DQPSK modulation
  * @QAM_4_NR:	4-QAM-NR modulation
+ * @QAM-1024:	1024-QAM modulation
+ * @QAM-4096:	4096-QAM modulation
+ * @APSK_8_L:	8APSK-L modulation
+ * @APSK_16_L:	16APSK-L modulation
+ * @APSK_32_L:	32APSK-L modulation
+ * @APSK_64:	64APSK modulation
+ * @APSK_64_L:	64APSK-L modulation
  *
  * Please note that not all modulations are supported by a given standard=
=2E
  *
@@ -350,6 +389,13 @@ enum fe_modulation {
 	APSK_32,
 	DQPSK,
 	QAM_4_NR,
+	QAM_1024,
+	QAM_4096,
+	APSK_8_L,
+	APSK_16_L,
+	APSK_32_L,
+	APSK_64,
+	APSK_64_L,
 };
=20
 /**
@@ -404,6 +450,7 @@ enum fe_transmit_mode {
  * @GUARD_INTERVAL_PN420:	PN length 420 (1/4)
  * @GUARD_INTERVAL_PN595:	PN length 595 (1/6)
  * @GUARD_INTERVAL_PN945:	PN length 945 (1/9)
+ * @GUARD_INTERVAL_1_64:	Guard interval 1/64
  *
  * Please note that not all guard intervals are supported by a given stan=
dard=2E
  */
@@ -419,6 +466,7 @@ enum fe_guard_interval {
 	GUARD_INTERVAL_PN420,
 	GUARD_INTERVAL_PN595,
 	GUARD_INTERVAL_PN945,
+	GUARD_INTERVAL_1_64,
 };
=20
 /**
@@ -571,6 +619,9 @@ enum fe_pilot {
  * @ROLLOFF_20:		Roloff factor: =CE=B1=3D20%
  * @ROLLOFF_25:		Roloff factor: =CE=B1=3D25%
  * @ROLLOFF_AUTO:	Auto-detect the roloff factor=2E
+ * @ROLLOFF_15:		Rolloff factor: =CE=B1=3D15%
+ * @ROLLOFF_10:		Rolloff factor: =CE=B1=3D10%
+ * @ROLLOFF_5:		Rolloff factor: =CE=B1=3D5%
  *
  * =2E=2E note:
  *
@@ -581,6 +632,9 @@ enum fe_rolloff {
 	ROLLOFF_20,
 	ROLLOFF_25,
 	ROLLOFF_AUTO,
+	ROLLOFF_15,
+	ROLLOFF_10,
+	ROLLOFF_5,
 };
=20
 /**
@@ -594,6 +648,8 @@ enum fe_rolloff {
  *	Cable TV: DVB-C following ITU-T J=2E83 Annex B spec (ClearQAM)
  * @SYS_DVBC_ANNEX_C:
  *	Cable TV: DVB-C following ITU-T J=2E83 Annex C spec
+ * @SYS_DVBC2:
+ *      Cable TV: DVB-C2
  * @SYS_ISDBC:
  *	Cable TV: ISDB-C (no drivers yet)
  * @SYS_DVBT:
@@ -611,7 +667,7 @@ enum fe_rolloff {
  * @SYS_DVBS:
  *	Satellite TV: DVB-S
  * @SYS_DVBS2:
- *	Satellite TV: DVB-S2
+ *	Satellite TV: DVB-S2 and DVB-S2X
  * @SYS_TURBO:
  *	Satellite TV: DVB-S Turbo
  * @SYS_ISDBS:
@@ -645,6 +701,7 @@ enum fe_delivery_system {
 	SYS_DVBT2,
 	SYS_TURBO,
 	SYS_DVBC_ANNEX_C,
+	SYS_DVBC2,
 };
=20
 /* backward compatibility definitions for delivery systems */
--=20
2=2E17=2E1

