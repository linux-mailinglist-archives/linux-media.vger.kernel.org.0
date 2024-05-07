Return-Path: <linux-media+bounces-10954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511A8BD89F
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736A41F212BB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDA48BE8;
	Tue,  7 May 2024 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="K5zBx8F0"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE019E
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041536; cv=none; b=qIeH3jD3g9kKlSykcDcLsqo3u47pDAiPHN1LI+hozWJerNe8x8H2bFmG8vkJwC+UQmZb1yM+WOk3+8ICGKmy9DpDvP2mmffOdFg/bwGWFh/fcrHwVFSokI4MJQzsJgOjIU59SqL9c3BZKf6XpF56brwxJG6+C4pN30NzFmyCfNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041536; c=relaxed/simple;
	bh=+/q3KgKBBjd7eys1EDa9bYyst1ufISVg+xsZP17DeBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCcoWYgjeF0SZMNXK1Wb4nPz6ewcCYStKl9CB4jIbWCEZ3Ej69JjCAC+jXY9z5UuBQVHKCkDK1haG5+teoQd5KXJkyXX37/uBryeAeGCI2PxCp9HM1t1wEy2SYCSCVFn0sRt3P2lrCFK3dHewGA/9FaRDiw55QP/Ekw0k1/Ljzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=K5zBx8F0; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041528; x=1715646328; i=herdler@nurfuerspam.de;
	bh=r4ZKA1+HNdu+SCUBAwAQEc+WZKmJGc/13/fw2hK8Fqs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=K5zBx8F087r+1jV6EsTQl1+AbXJl+VhKP1YYVk9Coig4UrfjGly36X63Bst1aWAV
	 D95cooR9sNK7jaWweb3IDPueWO1KtbDZG30osgBJj/OJi/p9SrJqMRaxQGPe0GnDR
	 byagWYADl7ytfaPgyY82GoX9YJM6o47LdxH/kAv610QB5g6BS2qUzQsOg/aLQUxor
	 z8PShQPPCOxQyciojZ7ufLnTWmu5dml9GCOorEMo7s5cgMrbmvTNqBjxiMswYOfRQ
	 kVbuX3e4+0/pGwwfS4iUxPD5AQcJWr5Y1kaJKFgtP//AD2JqBi/ojoFIPoLDLJ9Q8
	 7ZjYLYuFrSw4WS9uNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1rv1xZ1kUj-0098PG; Tue, 07
 May 2024 02:25:28 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 13/21] media: av7110: coding style fixes: braces
Date: Tue,  7 May 2024 02:24:52 +0200
Message-Id: <20240507002500.81867-14-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:q3/SMbHsx/5sIkz/SQNOjR2YlCDetyX5r+guKJ+qXdTMytLb+gC
 eg/mhLuEaLUathm2TgQibtylLuwxfh7XYD0l3jIgU6Xt3gFsE3TXFWcAjpvlfmGT7m7UYvD
 wvv4ibC+/tT5nsm6NEAs3G00xR/WBKWDPdUueUMLK9m5b5kdf+T/flmFhpk1NUYMHnDSMQ9
 CDCqnhYtskesn0VJb87Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uZ1GKotKF70=;sMUP3WEvNwysQA0IdEDsPVdsmnv
 ARz1auRYYqlVDHxPkrr2hRjaO92m++gta7l5BnqqV+nktfT08Fd7j20NVUxeZtKlYf2bA3smV
 P1re+svN1M9z1DDYRRDlgmNlKP7B+xfluSoBPZga1myZDnAY0G7+cwgXzUk2eE34XWx48h53T
 2HQI8dJ690t2WXAzrmazrDUe/PgqkdR1V+6E90B/7DS6D5tJyy6T20SaF1BC5yk/ckjvzW/Oy
 TYSvTFrek71xUpJs6do5p16/BjZLuIru1aCo/ZABlcwxKx3PsKgeni/024PfYEUc9K2qcsipi
 gsQY8rRnY69ubXD2TlGMUG/0ggUVncgUsVfisN7Ks0xWN2AlvzmRHS5m3dU4F27WR9AVf9XnF
 ND/LUJ77jw1qIzna0wIsitdWCysIRUmizVi8PPwqe/ua3dWyg+6xXnxLpXhtqgVaxlxASmCYO
 yeDZ+QjtzZRE+94lnSa9wK8F4Ae0rZiY5KrW2Cr2WQIKlnbiFb+GplRyY3rymHrnne8i0L3/d
 4c8ckk2TZ5is3wCZU/2g6yWwE1qli6Qw9aQyeMldQoRxX71Zzyyjb8lVEYMYR/bDFzTFJn7gL
 wrMw/FZGSSjpTVkFAmxhEOpghZivQ7MXYPbuwExx7mvuSQOv27Wp2neNxbpy+6JukzbYxQxnI
 H45zdOcoiQFpV6OA7OKo44jd37sDpQCiVQ2DUV4oB7kvwIqLR3JYBoHvkIuKCEqcfMcoQIheq
 vXclvjXs6KpzU2iizdpc+1WIXzlKweEGuuKyQFhQU+9uanhvqsfxY8C9Hgd0a7v8GPMRYNymJ
 KuF407hIx+X/MT6AydlOJQG7mnaY7+8GI9qLGd1phLjPk=

This patch fixes the following checkpatch warnings and errors:

WARNING:BRACES: braces {} are not necessary for any arm of this statement
WARNING:BRACES: braces {} are not necessary for single statement blocks
CHECK:BRACES: braces {} should be used on all arms of this statement
CHECK:BRACES: Unbalanced braces around else statement

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 27 +++++++++------------
 drivers/staging/media/av7110/av7110_av.c    | 16 +++++++-----
 drivers/staging/media/av7110/av7110_hw.c    |  8 +++---
 drivers/staging/media/av7110/av7110_ipack.c |  4 +--
 drivers/staging/media/av7110/av7110_v4l.c   | 11 ++++++---
 drivers/staging/media/av7110/dvb_filter.c   |  3 +--
 6 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 49735cbb2..78d708ffc 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -408,10 +408,11 @@ static void debiirq(struct tasklet_struct *t)
 			if (data[5] > 5)
 				flags |=3D CA_CI_MODULE_READY;
 			av7110->ci_slot[data_0].flags =3D flags;
-		} else
+		} else {
 			ci_get_data(&av7110->ci_rbuffer,
 				    av7110->debi_virt,
 				    av7110->debilen);
+		}
 		xfer =3D RX_BUFF;
 		break;
 	}
@@ -1010,10 +1011,9 @@ static int av7110_stop_feed(struct dvb_demux_feed *=
feed)
 			demux->pids[feed->pes_type] |=3D 0x8000;
 			demux->pesfilter[feed->pes_type] =3D NULL;
 		}
-		if (feed->ts_type & TS_DECODER &&
-		    feed->pes_type < DMX_PES_OTHER) {
+		if (feed->ts_type & TS_DECODER && feed->pes_type < DMX_PES_OTHER)
 			ret =3D dvb_feed_stop_pid(feed);
-		} else
+		else
 			if ((feed->ts_type & TS_PACKET) &&
 			    (demux->dmx.frontend->source !=3D DMX_MEMORY_FE))
 				ret =3D StopHWFilter(feed->filter);
@@ -1245,10 +1245,10 @@ static void vpeirq(struct tasklet_struct *t)
 	       saa7146_read(budget->dev, EC1R) & 0x3fff);
 #endif

-	if (newdma > olddma)
+	if (newdma > olddma) {
 		/* no wraparound, dump olddma..newdma */
 		dvb_dmx_swfilter_packets(demux, mem + olddma, (newdma - olddma) / 188);
-	else {
+	} else {
 		/* wraparound, dump olddma..buflen and 0..newdma */
 		dvb_dmx_swfilter_packets(demux, mem + olddma, (TS_BUFLEN - olddma) / 18=
8);
 		dvb_dmx_swfilter_packets(demux, mem, newdma / 188);
@@ -1488,9 +1488,10 @@ static int get_firmware(struct av7110 *av7110)
 			printk(KERN_ERR "dvb-ttpci: could not load firmware, file not found: d=
vb-ttpci-01.fw\n");
 			printk(KERN_ERR "dvb-ttpci: usually this should be in /usr/lib/hotplug=
/firmware or /lib/firmware\n");
 			printk(KERN_ERR "dvb-ttpci: and can be downloaded from https://linuxtv=
.org/download/dvb/firmware/\n");
-		} else
+		} else {
 			printk(KERN_ERR "dvb-ttpci: cannot request firmware (error %i)\n",
 			       ret);
+		}
 		return -EINVAL;
 	}

@@ -2076,9 +2077,8 @@ static int frontend_init(struct av7110 *av7110)
 		case 0x0000: // Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??))
 			av7110->fe =3D dvb_attach(ves1820_attach, &philips_cd1516_config,
 						&av7110->i2c_adap, read_pwm(av7110));
-			if (av7110->fe) {
+			if (av7110->fe)
 				av7110->fe->ops.tuner_ops.set_params =3D philips_cd1516_tuner_set_par=
ams;
-			}
 			break;
 		}

@@ -2129,17 +2129,15 @@ static int frontend_init(struct av7110 *av7110)
 				/* Siemens DVB-C (full-length card) VES1820/Philips CD1516 */
 				av7110->fe =3D dvb_attach(ves1820_attach, &philips_cd1516_config, &av=
7110->i2c_adap,
 							read_pwm(av7110));
-				if (av7110->fe) {
+				if (av7110->fe)
 					av7110->fe->ops.tuner_ops.set_params =3D philips_cd1516_tuner_set_pa=
rams;
-				}
 				break;
 			case 0x0003:
 				/* Hauppauge DVB-C 2.1 VES1820/ALPS TDBE2 */
 				av7110->fe =3D dvb_attach(ves1820_attach, &alps_tdbe2_config, &av7110=
->i2c_adap,
 							read_pwm(av7110));
-				if (av7110->fe) {
+				if (av7110->fe)
 					av7110->fe->ops.tuner_ops.set_params =3D alps_tdbe2_tuner_set_params=
;
-				}
 				break;
 			}
 			break;
@@ -2168,9 +2166,8 @@ static int frontend_init(struct av7110 *av7110)
 		case 0x0002: // Hauppauge/TT DVB-C premium rev2.X

 			av7110->fe =3D dvb_attach(ves1820_attach, &alps_tdbe2_config, &av7110-=
>i2c_adap, read_pwm(av7110));
-			if (av7110->fe) {
+			if (av7110->fe)
 				av7110->fe->ops.tuner_ops.set_params =3D alps_tdbe2_tuner_set_params;
-			}
 			break;

 		case 0x0004: // Galaxis DVB-S rev1.3
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index f5200aa3d..35af0cd6d 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -412,8 +412,9 @@ static void play_video_cb(u8 *buf, int count, void *pr=
iv)
 	if ((buf[3] & 0xe0) =3D=3D 0xe0) {
 		get_video_format(av7110, buf, count);
 		aux_ring_buffer_write(&av7110->avout, buf, count);
-	} else
+	} else {
 		aux_ring_buffer_write(&av7110->aout, buf, count);
+	}
 }

 static void play_audio_cb(u8 *buf, int count, void *priv)
@@ -610,8 +611,9 @@ static int find_pes_header(u8 const *buf, long int len=
gth, int *frags)
 				c++;
 				break;
 			}
-		} else
+		} else {
 			c++;
+		}
 	}
 	if (c =3D=3D length - 3 && !found) {
 		if (buf[length - 1] =3D=3D 0x00)
@@ -709,8 +711,9 @@ void av7110_p2t_write(u8 const *buf, long int length, =
u16 pid, struct av7110_p2t
 				c =3D c2;
 				clear_p2t(p);
 				add =3D 0;
-			} else
+			} else {
 				add =3D 1;
+			}
 		} else {
 			l =3D length - c;
 			rest =3D l % (TS_SIZE - 4);
@@ -981,8 +984,10 @@ static __poll_t dvb_audio_poll(struct file *file, pol=
l_table *wait)
 	if (av7110->playing) {
 		if (dvb_ringbuffer_free(&av7110->aout) >=3D 20 * 1024)
 			mask |=3D (EPOLLOUT | EPOLLWRNORM);
-	} else /* if not playing: may play if asked for */
+	} else {
+		/* if not playing: may play if asked for */
 		mask =3D (EPOLLOUT | EPOLLWRNORM);
+	}

 	return mask;
 }
@@ -1532,9 +1537,8 @@ static int dvb_video_release(struct inode *inode, st=
ruct file *file)

 	dprintk(2, "av7110:%p, \n", av7110);

-	if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY) {
+	if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY)
 		av7110_av_stop(av7110, RP_VIDEO);
-	}

 	return dvb_generic_release(inode, file);
 }
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index c7ea72128..d775dd632 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -1076,9 +1076,9 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		ret =3D OSDSetColor(av7110, dc->color, dc->x0, dc->y0, dc->x1, dc->y1);
 		break;
 	case OSD_SetPalette:
-		if (FW_VERSION(av7110->arm_app) >=3D 0x2618)
+		if (FW_VERSION(av7110->arm_app) >=3D 0x2618) {
 			ret =3D OSDSetPalette(av7110, dc->data, dc->color, dc->x0);
-		else {
+		} else {
 			int i, len =3D dc->x0 - dc->color + 1;
 			u8 __user *colors =3D (u8 __user *)dc->data;
 			u8 r, g =3D 0, b =3D 0, blend =3D 0;
@@ -1140,9 +1140,9 @@ int av7110_osd_cmd(struct av7110 *av7110, osd_cmd_t =
*dc)
 		break;
 	}
 	case OSD_SetWindow:
-		if (dc->x0 < 1 || dc->x0 > 7)
+		if (dc->x0 < 1 || dc->x0 > 7) {
 			ret =3D -EINVAL;
-		else {
+		} else {
 			av7110->osdwin =3D dc->x0;
 			ret =3D 0;
 		}
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index 9fe18f470..c18a9f586 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -215,9 +215,9 @@ int av7110_ipack_instant_repack(const u8 *buf, int cou=
nt, struct ipack *p)
 				p->flag1 =3D buf[c];
 				c++;
 				p->found++;
-				if ((p->flag1 & 0xc0) =3D=3D 0x80)
+				if ((p->flag1 & 0xc0) =3D=3D 0x80) {
 					p->mpeg =3D 2;
-				else {
+				} else {
 					p->hlength =3D 0;
 					p->which =3D 0;
 					p->mpeg =3D 1;
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 633dbb697..f19e50537 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -330,8 +330,10 @@ static int vidioc_g_tuner(struct file *file, void *fh=
, struct v4l2_tuner *t)
 		/* bilingual */
 		t->rxsubchans =3D V4L2_TUNER_SUB_LANG1 | V4L2_TUNER_SUB_LANG2;
 		t->audmode =3D V4L2_TUNER_MODE_LANG1;
-	} else /* mono */
+	} else {
+		/* mono */
 		t->rxsubchans =3D V4L2_TUNER_SUB_MONO;
+	}

 	return 0;
 }
@@ -709,8 +711,9 @@ int av7110_init_analog_module(struct av7110 *av7110)
 		pr_info("DVB-C analog module @ card %d detected, initializing MSP3415\n=
",
 			av7110->dvb_adapter.num);
 		av7110->adac_type =3D DVB_ADAC_MSP34x5;
-	} else
+	} else {
 		return -ENODEV;
+	}

 	msleep(100); // the probing above resets the msp...
 	msp_readreg(av7110, MSP_RD_DSP, 0x001e, &version1);
@@ -922,9 +925,9 @@ static int std_callback(struct saa7146_dev *dev, struc=
t saa7146_standard *std)
 	} else if (std->id & V4L2_STD_NTSC) {
 		av7110->vidmode =3D AV7110_VIDEO_MODE_NTSC;
 		av7110_set_vidmode(av7110, av7110->vidmode);
-	}
-	else
+	} else {
 		return -1;
+	}

 	return 0;
 }
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index 515b4288b..f92faae44 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -33,9 +33,8 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct d=
vb_audio_info *ai, int p

 		if (b[0] =3D=3D 0x0b &&  b[1] =3D=3D 0x77)
 			found =3D 1;
-		else {
+		else
 			c++;
-		}
 	}

 	if (!found)
=2D-
2.34.0


