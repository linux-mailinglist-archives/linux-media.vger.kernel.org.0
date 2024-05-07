Return-Path: <linux-media+bounces-10956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA08BD8A3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 504871F24982
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A439D65F;
	Tue,  7 May 2024 00:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="GtW3KVry"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1364A
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041651; cv=none; b=GV/HNpfXwXm/0T+jc5tDpCYG45z3Hf9koyWwmHfNMrWsLZVh+QucoE9D64fACd52mc4ihgvi9ACeyJu9cWgRVF6jzL51Qw/snoePgikiDoG5V9HkQ7KVA185RiWRAVYSIAd0rXKGQPS3SkL1o4+qU7sKh+shTwGs7A4bm5+hq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041651; c=relaxed/simple;
	bh=CNxeGKCBepWjlCX4R7etSmDFomjRZLo8CZXL6/oHvrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r1b+fnyMTovUbesfFk0SZWhS5DnspzubI/RMH1cWG6CjEtsAubGq6NJGvXSqHTwYr7+oaDjvnR+mivsVZ+230i+NHF690Hu3PcHcHxgiG8Tcuq9opZgGdxYXvNgrYRz/KjR0KX/dDnvyFVwg9Whpck7tKVSTvd2ELeWES+B9lHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=GtW3KVry; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041646; x=1715646446; i=herdler@nurfuerspam.de;
	bh=pl8t2uXfzkD5OxCLTeB/3ddO2oeRRbPyuBlZFITseFQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GtW3KVry5oM+Og4uh5bzLNFJkwLtlHO55mtfaMPWisSTg546wFv/sUuGKQ2MLElB
	 jDxWUaBY5CpRyXbb9WMVG4fvB3nHhXN66VSeBXxn6W9yTGVnpOUf3w/GTpEmZLXS2
	 pnRYLMpL+6mes2kQ9DBHfQt5UhLZNi20DxRI1YK7JoC1nE9BTL5igvTDHyPZYiOWe
	 L2ZpIlqB9Ny5Hd1JdmJUPdfmebjUoq6exzcCOcxQhQEYZamSDdH7Hkj7B49W6rTDQ
	 PfdkZLKeR3J2tC4DdoJlglAsj8ppJ7NCm5KQBKA8J6JDwE+uQlOiWhMtKH1h6Icym
	 yZETpIuHhGayXkBH8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDEm-1sUdn407lY-00jsSn; Tue, 07
 May 2024 02:27:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 21/21] media: av7110: coding style fixes: avoid_externs
Date: Tue,  7 May 2024 02:25:00 +0200
Message-Id: <20240507002500.81867-22-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R0Box3A9inhoZc7B7Vf2lGBL4gYTjYmJf+P5Cdd+0g+n20ooc+n
 tUqewFZPC4HX5RZmqpuNv9Lnn8xTzNPjE1Qrw2qkKZZapNUN30lqhAPRMdOcf+jjXvNvtUB
 Mb9cTzyh8idCfJmsrA8dDxve8E8cy9eyMd1uipgkW7yCoAcD4av4LQxA1ISNA6mIBZdGcY8
 FCBjnOmPyY1/wcMjAhs3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uhsvJmqP1qQ=;jGYwYAj/+OtSQMG7ZEdacLuaFoR
 QvOQMlp94Oz3Rv5YNynEGz5UzmJwgCkuuI+/CDyVdc/uZVDLHkly2/6MIFAfxp1Xq6ZGSjNg0
 UMXD9744QgKWZ17TEtuJNR+A1gOPB5UiKsgI4IRQ2tWIJLBFcb93nAx5yb/mHeKwZNOGeVhvZ
 kYu1vPAz6pJlqmnV2WhSWFQakrhj7BqDvtMik1uEmS8ViwqJ1NmGuG1EtRssO2JZzDP2QOXAE
 DAcpSpc8y1u/kVofIEne9hiOEPBQ8jFh5xdhooyFujx1K3SwE9DMoMQolnqWkIxfTjLQec2XU
 adqvC7ZmpnSFAtO8DFOxfII6H+bZiPpcAAjA2uUz6XTkCKdpAdgAcFX9MrW+98MAtu+DOd9Vo
 9Kw5NcLIRBcXdBEi5fKPmqiM3DiIl7wNOEsEDE3UG+XI7Ps8qhFkVW+uTdIJIdaFwKA2+uAyA
 lrCwXGrf5HP0bDFkzHusDH7Uig/SWd0brv9tWT1V6u0m0JRb4hBNKW9J42oRqqtdifjS+Ewp+
 85D9bT7yJMedLd39VXZ6PiVphsl1svCy+JEkxxcieA9j91Op4Dp/jAJc4wyX/b2zSiV1tc/eq
 gZ3jggFFr0zBxXqQcUJ3C8fotH4p5z/i0cXkVIjAj5pxYq5F4+ambI21Uf94u/iVy1fqQA+Wx
 aHlL/NKJIEM/8fh096dKr3DlGMWKEk6CSkZcZV6oDQ/h2LIVs1PNOiy5xClHtZ2btOCz4Tl6O
 7+AId7fTLlfVYwNwYqloeyyquhArzwOgr8fKNn8P5JkNgGC4eT+z1iXXTo/MglJmBRNzJB0+P
 DayPqGIm9eXeqP0tQuxPMsRMEhIdhAFCXhv51kvtgPwgQ=

This patch fixes the following checkpatch warnings:

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files

Removing unnecessary 'extern' declaration of function prototypes in
header files.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.h       | 16 ++++-----
 drivers/staging/media/av7110/av7110_av.h    | 36 ++++++++++-----------
 drivers/staging/media/av7110/av7110_ca.h    | 12 +++----
 drivers/staging/media/av7110/av7110_hw.h    | 26 +++++++--------
 drivers/staging/media/av7110/av7110_ipack.h | 12 +++----
 5 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index 403dbbba5..ec461fd18 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -284,8 +284,8 @@ struct av7110 {
 	int (*fe_set_frontend)(struct dvb_frontend *fe);
 };

-extern int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpi=
d,
-		      u16 subpid, u16 pcrpid);
+int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
+	       u16 subpid, u16 pcrpid);

 void av7110_ir_handler(struct av7110 *av7110, u32 ircom);
 int av7110_set_ir_config(struct av7110 *av7110);
@@ -298,12 +298,12 @@ void av7110_ir_exit(struct av7110 *av7110);
 #define MSP_WR_DSP 0x12
 #define MSP_RD_DSP 0x13

-extern int i2c_writereg(struct av7110 *av7110, u8 id, u8 reg, u8 val);
-extern u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg);
-extern int msp_writereg(struct av7110 *av7110, u8 dev, u16 reg, u16 val);
+int i2c_writereg(struct av7110 *av7110, u8 id, u8 reg, u8 val);
+u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg);
+int msp_writereg(struct av7110 *av7110, u8 dev, u16 reg, u16 val);

-extern int av7110_init_analog_module(struct av7110 *av7110);
-extern int av7110_init_v4l(struct av7110 *av7110);
-extern int av7110_exit_v4l(struct av7110 *av7110);
+int av7110_init_analog_module(struct av7110 *av7110);
+int av7110_init_v4l(struct av7110 *av7110);
+int av7110_exit_v4l(struct av7110 *av7110);

 #endif /* _AV7110_H_ */
diff --git a/drivers/staging/media/av7110/av7110_av.h b/drivers/staging/me=
dia/av7110/av7110_av.h
index f1c5c26c6..eebaf59c7 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.h
+++ b/drivers/staging/media/av7110/av7110_av.h
@@ -4,28 +4,28 @@

 struct av7110;

-extern int av7110_set_vidmode(struct av7110 *av7110,
-			      enum av7110_video_mode mode);
+int av7110_set_vidmode(struct av7110 *av7110,
+		       enum av7110_video_mode mode);

-extern int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_=
t len);
-extern int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dl=
en);
-extern int av7110_write_to_decoder(struct dvb_demux_feed *feed, const u8 =
*buf, size_t len);
+int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len);
+int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen);
+int av7110_write_to_decoder(struct dvb_demux_feed *feed, const u8 *buf, s=
ize_t len);

-extern int av7110_set_volume(struct av7110 *av7110, unsigned int volleft,
-			     unsigned int volright);
-extern int av7110_av_stop(struct av7110 *av7110, int av);
-extern int av7110_av_start_record(struct av7110 *av7110, int av,
-				  struct dvb_demux_feed *dvbdmxfeed);
-extern int av7110_av_start_play(struct av7110 *av7110, int av);
+int av7110_set_volume(struct av7110 *av7110, unsigned int volleft,
+		      unsigned int volright);
+int av7110_av_stop(struct av7110 *av7110, int av);
+int av7110_av_start_record(struct av7110 *av7110, int av,
+			   struct dvb_demux_feed *dvbdmxfeed);
+int av7110_av_start_play(struct av7110 *av7110, int av);

-extern void dvb_video_add_event(struct av7110 *av7110, struct video_event=
 *event);
+void dvb_video_add_event(struct av7110 *av7110, struct video_event *event=
);

-extern void av7110_p2t_init(struct av7110_p2t *p, struct dvb_demux_feed *=
feed);
-extern void av7110_p2t_write(u8 const *buf, long length, u16 pid, struct =
av7110_p2t *p);
+void av7110_p2t_init(struct av7110_p2t *p, struct dvb_demux_feed *feed);
+void av7110_p2t_write(u8 const *buf, long length, u16 pid, struct av7110_=
p2t *p);

-extern int av7110_av_register(struct av7110 *av7110);
-extern void av7110_av_unregister(struct av7110 *av7110);
-extern int av7110_av_init(struct av7110 *av7110);
-extern void av7110_av_exit(struct av7110 *av7110);
+int av7110_av_register(struct av7110 *av7110);
+void av7110_av_unregister(struct av7110 *av7110);
+int av7110_av_init(struct av7110 *av7110);
+void av7110_av_exit(struct av7110 *av7110);

 #endif /* _AV7110_AV_H_ */
diff --git a/drivers/staging/media/av7110/av7110_ca.h b/drivers/staging/me=
dia/av7110/av7110_ca.h
index a6e3f2955..d3521944b 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.h
+++ b/drivers/staging/media/av7110/av7110_ca.h
@@ -4,12 +4,12 @@

 struct av7110;

-extern void CI_handle(struct av7110 *av7110, u8 *data, u16 len);
-extern void ci_get_data(struct dvb_ringbuffer *cibuf, u8 *data, int len);
+void CI_handle(struct av7110 *av7110, u8 *data, u16 len);
+void ci_get_data(struct dvb_ringbuffer *cibuf, u8 *data, int len);

-extern int av7110_ca_register(struct av7110 *av7110);
-extern void av7110_ca_unregister(struct av7110 *av7110);
-extern int av7110_ca_init(struct av7110* av7110);
-extern void av7110_ca_exit(struct av7110* av7110);
+int av7110_ca_register(struct av7110 *av7110);
+void av7110_ca_unregister(struct av7110 *av7110);
+int av7110_ca_init(struct av7110 *av7110);
+void av7110_ca_exit(struct av7110 *av7110);

 #endif /* _AV7110_CA_H_ */
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index c13b8c479..d4579f411 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -357,22 +357,22 @@ enum av7110_command_type {
 #define DEBI_DONE_LINE		1
 #define ARM_IRQ_LINE		0

-extern int av7110_bootarm(struct av7110 *av7110);
-extern int av7110_firmversion(struct av7110 *av7110);
+int av7110_bootarm(struct av7110 *av7110);
+int av7110_firmversion(struct av7110 *av7110);
 #define FW_CI_LL_SUPPORT(arm_app) ((arm_app) & 0x80000000)
 #define FW_4M_SDRAM(arm_app)      ((arm_app) & 0x40000000)
 #define FW_VERSION(arm_app)	  ((arm_app) & 0x0000FFFF)

-extern int av7110_wait_msgstate(struct av7110 *av7110, u16 flags);
-extern int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int nu=
m, ...);
-extern int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
-			     int request_buf_len, u16 *reply_buf, int reply_buf_len);
+int av7110_wait_msgstate(struct av7110 *av7110, u16 flags);
+int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)=
;
+int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
+		      int request_buf_len, u16 *reply_buf, int reply_buf_len);

 /* DEBI (saa7146 data extension bus interface) access */
-extern int av7110_debiwrite(struct av7110 *av7110, u32 config,
-			    int addr, u32 val, unsigned int count);
-extern u32 av7110_debiread(struct av7110 *av7110, u32 config,
-			   int addr, unsigned int count);
+int av7110_debiwrite(struct av7110 *av7110, u32 config,
+		     int addr, u32 val, unsigned int count);
+u32 av7110_debiread(struct av7110 *av7110, u32 config,
+		    int addr, unsigned int count);

 /* DEBI during interrupt */
 /* single word writes */
@@ -473,11 +473,11 @@ static inline int Set22K(struct av7110 *av7110, int =
state)
 	return av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, (state ? ON22K : OFF22K),=
 0);
 }

-extern int av7110_diseqc_send(struct av7110 *av7110, int len, u8 *msg, un=
signed long burst);
+int av7110_diseqc_send(struct av7110 *av7110, int len, u8 *msg, unsigned =
long burst);

 #ifdef CONFIG_DVB_AV7110_OSD
-extern int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t *dc);
-extern int av7110_osd_capability(struct av7110 *av7110, osd_cap_t *cap);
+int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t *dc);
+int av7110_osd_capability(struct av7110 *av7110, osd_cap_t *cap);
 #endif /* CONFIG_DVB_AV7110_OSD */

 #endif /* _AV7110_HW_H_ */
diff --git a/drivers/staging/media/av7110/av7110_ipack.h b/drivers/staging=
/media/av7110/av7110_ipack.h
index 943ec899b..55296421d 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.h
+++ b/drivers/staging/media/av7110/av7110_ipack.h
@@ -2,12 +2,12 @@
 #ifndef _AV7110_IPACK_H_
 #define _AV7110_IPACK_H_

-extern int av7110_ipack_init(struct ipack *p, int size,
-			     void (*func)(u8 *buf,  int size, void *priv));
+int av7110_ipack_init(struct ipack *p, int size,
+		      void (*func)(u8 *buf,  int size, void *priv));

-extern void av7110_ipack_reset(struct ipack *p);
-extern int  av7110_ipack_instant_repack(const u8 *buf, int count, struct =
ipack *p);
-extern void av7110_ipack_free(struct ipack * p);
-extern void av7110_ipack_flush(struct ipack *p);
+void av7110_ipack_reset(struct ipack *p);
+int  av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *=
p);
+void av7110_ipack_free(struct ipack *p);
+void av7110_ipack_flush(struct ipack *p);

 #endif
=2D-
2.34.0


