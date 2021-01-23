Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173A330159E
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 15:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbhAWOBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jan 2021 09:01:55 -0500
Received: from djelibeybi.uuid.uk ([45.91.101.70]:42822 "EHLO
        djelibeybi.uuid.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbhAWOBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jan 2021 09:01:53 -0500
X-Greylist: delayed 543 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Jan 2021 09:01:51 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:From:Sender:Reply-To:
        Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Disposition:
        Content-Transfer-Encoding:In-Reply-To:References;
        bh=9yi8n4cZJOjr09YL/Nj8qqiDRq3Y1W9pWI/O3Zd7p2Q=; b=xodi7lh48KqKrq5ECRSUJ7Xfzb
        04TtYWCCWGDIv1bEmn+EiHBoCr9tpjOzj4VdbpNHzrlMEI8zkg3AqFxCgwMHrkuZqnY623KHJgkrY
        n/PlMzUEiKxUGhTegjWQVJlWMqPHm6shDIkvvnbQ+tI3x9ORT+t6Mu69g9ZTJgr7obG3z1WIQ/Ts0
        IUfKYZ/eXD8dq28rxtEBc6sgyYSvkI6G6Qr2iFW/2sEiu9Mhpi5QunDP/Hr0Czej/axi18zl2tqRR
        il8huxxYUBfYHsqPJXUVcyF1ILpU/0gMXYPEbCBrbVO3f8wSZY2VuQJY/uAxFV082oiy9N3Bfcjwk
        yRLQ5qyw==;
Received: by djelibeybi.uuid.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <v4l@octiron.net>)
        id 1l3JKZ-0002EZ-L9
        for linux-media@vger.kernel.org; Sat, 23 Jan 2021 13:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:From:Sender:Reply-To:
        Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Disposition:
        Content-Transfer-Encoding:In-Reply-To:References;
        bh=9yi8n4cZJOjr09YL/Nj8qqiDRq3Y1W9pWI/O3Zd7p2Q=; b=xodi7lh48KqKrq5ECRSUJ7Xfzb
        04TtYWCCWGDIv1bEmn+EiHBoCr9tpjOzj4VdbpNHzrlMEI8zkg3AqFxCgwMHrkuZqnY623KHJgkrY
        n/PlMzUEiKxUGhTegjWQVJlWMqPHm6shDIkvvnbQ+tI3x9ORT+t6Mu69g9ZTJgr7obG3z1WIQ/Ts0
        IUfKYZ/eXD8dq28rxtEBc6sgyYSvkI6G6Qr2iFW/2sEiu9Mhpi5QunDP/Hr0Czej/axi18zl2tqRR
        il8huxxYUBfYHsqPJXUVcyF1ILpU/0gMXYPEbCBrbVO3f8wSZY2VuQJY/uAxFV082oiy9N3Bfcjwk
        yRLQ5qyw==;
Received: by tsort.uuid.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <v4l@octiron.net>)
        id 1l3JKX-0006Cq-Tv
        for linux-media@vger.kernel.org; Sat, 23 Jan 2021 13:51:58 +0000
Subject: [PATCH 2/2] dvbv5-zap: Record all the channel video/audio/other PIDs
To:     linux-media@vger.kernel.org
References: <da8f5aa8-e413-1678-d93d-6e8d20fb97b6@0882a8b5-c6c3-11e9-b005-00805fc181fe>
From:   Simon Arlott <v4l@octiron.net>
X-Face: -|Y&Xues/.'(7\@`_\lFE/)pw"7..-Ur1^@pRL`Nad5a()6r+Y)18-pi'!`GI/zGn>6a6ik
 mcW-%sg_wM:4PXDw:(;Uu,n&!8=;A<P|QG`;AMu5ypJkN-Sa<eyt,Ap3q`5Z{D0BN3G`OmX^8x^++R
 Gr9G'%+PNM/w+w1+vB*a($wYgA%*cm3Hds`a7k)CQ7'"[\C|g2k]FQ-f*DDi{pU]v%5JZm
Message-ID: <16e9ea29-3373-f59f-772d-b7a9b2df21cb@0882a8b5-c6c3-11e9-b005-00805fc181fe>
Date:   Sat, 23 Jan 2021 13:51:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da8f5aa8-e413-1678-d93d-6e8d20fb97b6@0882a8b5-c6c3-11e9-b005-00805fc181fe>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The channel format doesn't include the language of the audio PIDs, so how
is anyone supposed to select the right one?

Make it possible to request all of them. This also includes subtitles.

Signed-off-by: Simon Arlott <v4l@octiron.net>
---
 utils/dvb/dvbv5-zap.c | 187 +++++++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 68 deletions(-)

diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
index 8420d99d..d7dcbfc4 100644
--- a/utils/dvb/dvbv5-zap.c
+++ b/utils/dvb/dvbv5-zap.c
@@ -92,7 +92,7 @@ struct arguments {
 	int lna, lnb, sat_number;
 	unsigned diseqc_wait, silent, verbose, frontend_only, freq_bpf;
 	unsigned timeout, dvr, rec_psi, exit_after_tuning;
-	unsigned n_apid, n_vpid, all_pids;
+	unsigned n_apid, n_vpid, extra_pids, all_pids;
 	enum dvb_file_formats input_format, output_format;
 	unsigned traffic_monitor, low_traffic, non_human, port;
 	char *search, *server;
@@ -106,6 +106,7 @@ static const struct argp_option options[] = {
 	{"adapter",	'a', N_("adapter#"),		0, N_("use given adapter (default 0)"), 0},
 	{"audio_pid",	'A', N_("audio_pid#"),		0, N_("audio pid program to use (default 0)"), 0},
 	{"channels",	'c', N_("file"),		0, N_("read channels list from 'file'"), 0},
+	{"extra-pids",	'E', NULL,			0, N_("output all channel pids"), 0 },
 	{"demux",	'd', N_("demux#"),		0, N_("use given demux (default 0)"), 0},
 	{"frontend",	'f', N_("frontend#"),		0, N_("use given frontend (default 0)"), 0},
 	{"input-format", 'I',	N_("format"),		0, N_("Input format: ZAP, CHANNEL, DVBV5 (default: DVBV5)"), 0},
@@ -165,16 +166,24 @@ static int timeout_flag = 0;
 	} while (0)
 
 
+/*
+ * Find channel configuration.
+ * On success, the caller must dvb_file_free(*out_file).
+ */
 static int parse(struct arguments *args,
 		 struct dvb_v5_fe_parms *parms,
-		 char *channel,
-		 int *vpid, int *apid, int *sid)
+		 const char *channel,
+		 struct dvb_file **out_file,
+		 const struct dvb_entry **out_entry)
 {
 	struct dvb_file *dvb_file;
 	struct dvb_entry *entry;
 	int i;
 	uint32_t sys;
 
+	*out_file = NULL;
+	*out_entry = NULL;
+
 	/* This is used only when reading old formats */
 	switch (parms->current_sys) {
 	case SYS_DVBT:
@@ -265,18 +274,6 @@ static int parse(struct arguments *args,
 	if (parms->sat_number < 0 && entry->sat_number >= 0)
 		parms->sat_number = entry->sat_number;
 
-	if (entry->video_pid) {
-		if (args->n_vpid < entry->video_pid_len)
-			*vpid = entry->video_pid[args->n_vpid];
-		else
-			*vpid = entry->video_pid[0];
-	}
-	if (entry->audio_pid) {
-		if (args->n_apid < entry->audio_pid_len)
-			*apid = entry->audio_pid[args->n_apid];
-		else
-		*apid = entry->audio_pid[0];
-	}
 	if (entry->other_el_pid) {
 		int i, type = -1;
 		for (i = 0; i < entry->other_el_pid_len; i++) {
@@ -290,7 +287,6 @@ static int parse(struct arguments *args,
 		}
 		fprintf(stderr, "\n");
 	}
-	*sid = entry->service_id;
 
         /* First of all, set the delivery system */
 	dvb_retrieve_entry_prop(entry, DTV_DELIVERY_SYSTEM, &sys);
@@ -335,7 +331,8 @@ static int parse(struct arguments *args,
 		}
 	}
 
-	dvb_file_free(dvb_file);
+	*out_file = dvb_file;
+	*out_entry = entry;
 	return 0;
 }
 
@@ -681,8 +678,11 @@ static error_t parse_opt(int k, char *optarg, struct argp_state *state)
 	case 'V':
 		args->n_vpid = strtoul(optarg, NULL, 0);
 		break;
+	case 'E':
+		args->extra_pids = 1;
+		break;
 	case 'P':
-		args->all_pids++;
+		args->all_pids = 1;
 		break;
 	case 'm':
 		args->traffic_monitor = 1;
@@ -1025,12 +1025,12 @@ int main(int argc, char **argv)
 	char *homedir = getenv("HOME");
 	char *channel = NULL;
 	int lnb = -1, idx = -1;
-	int vpid = -1, apid = -1, sid = -1;
 	int pmtpid = 0;
+	struct dvb_file *dvb_file = NULL;
+	const struct dvb_entry *dvb_entry = NULL;
 	struct dvb_open_descriptor *pat_fd = NULL, *pmt_fd = NULL;
 	struct dvb_open_descriptor *sdt_fd = NULL;
 	struct dvb_open_descriptor *sid_fd = NULL, *dvr_fd = NULL;
-	struct dvb_open_descriptor *audio_fd = NULL, *video_fd = NULL;
 	int file_fd = -1;
 	int err = -1;
 	int r, ret;
@@ -1160,7 +1160,7 @@ int main(int argc, char **argv)
 	if (r < 0)
 		fprintf(stderr, _("Failed to set the country code:%s\n"), args.cc);
 
-	if (parse(&args, parms, channel, &vpid, &apid, &sid))
+	if (parse(&args, parms, channel, &dvb_file, &dvb_entry))
 		goto err;
 
 	if (setup_frontend(&args, parms) < 0)
@@ -1190,23 +1190,16 @@ int main(int argc, char **argv)
 	}
 
 	if (args.rec_psi) {
-		if (sid < 0) {
-			fprintf(stderr, _("Service id 0x%04x was not specified at the file\n"),
-				sid);
-			goto err;
-		}
-
 		sid_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
 		if (!sid_fd) {
 			ERROR("opening sid demux failed");
 			return -1;
 		}
-		pmtpid = dvb_dev_dmx_get_pmt_pid(sid_fd, sid);
+		pmtpid = dvb_dev_dmx_get_pmt_pid(sid_fd, dvb_entry->service_id);
 		dvb_dev_close(sid_fd);
 		if (pmtpid <= 0) {
 			fprintf(stderr, _("couldn't find pmt-pid for sid %04x\n"),
-				sid);
-
+				dvb_entry->service_id);
 			goto err;
 		}
 
@@ -1244,58 +1237,112 @@ int main(int argc, char **argv)
 			goto err;
 	}
 
-	if (args.all_pids++) {
-		vpid = 0x2000;
-		apid = 0;
-	}
-	if (vpid >= 0) {
-		if (args.silent < 2) {
-			if (vpid == 0x2000)
-				fprintf(stderr, _("pass all PID's to TS\n"));
-			else
-				fprintf(stderr, _("video pid %d\n"), vpid);
-		}
-		video_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
+	if (args.all_pids) {
+		struct dvb_open_descriptor *video_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
 		if (!video_fd) {
 			ERROR("failed opening '%s'", args.demux_dev);
 			goto err;
 		}
 
-		if (args.silent < 2)
-			fprintf(stderr, _("  dvb_set_pesfilter %d\n"), vpid);
-
 		fprintf(stderr, _("dvb_dev_set_bufsize: buffer set to %d\n"), DVB_BUF_SIZE);
 		dvb_dev_set_bufsize(video_fd, DVB_BUF_SIZE);
 
-		if (vpid == 0x2000) {
-			if (dvb_dev_dmx_set_pesfilter(video_fd, vpid, DMX_PES_OTHER,
-					      DMX_OUT_TS_TAP, 0) < 0)
-				goto err;
-		} else {
-			if (dvb_dev_dmx_set_pesfilter(video_fd, vpid, DMX_PES_VIDEO,
-				args.dvr ? DMX_OUT_TS_TAP : DMX_OUT_DECODER,
-				args.dvr ? 64 * 1024 : 0) < 0)
-				goto err;
+		if (args.silent < 2) {
+			fprintf(stderr, _("pass all PIDs to TS\n"));
+			fprintf(stderr, _("  dvb_set_pesfilter %d\n"), 0x2000);
 		}
-	}
 
-	if (apid > 0) {
-		if (args.silent < 2)
-			fprintf(stderr, _("audio pid %d\n"), apid);
-		audio_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
-		if (!audio_fd) {
-			ERROR("failed opening '%s'", args.demux_dev);
+		if (dvb_dev_dmx_set_pesfilter(video_fd, 0x2000, DMX_PES_OTHER,
+				      DMX_OUT_TS_TAP, 0) < 0) {
 			goto err;
 		}
-		if (args.silent < 2)
-			fprintf(stderr, _("  dvb_set_pesfilter %d\n"), apid);
-		if (dvb_dev_dmx_set_pesfilter(audio_fd, apid, DMX_PES_AUDIO,
-				args.dvr ? DMX_OUT_TS_TAP : DMX_OUT_DECODER,
-				args.dvr ? 64 * 1024 : 0) < 0)
-			goto err;
+	} else {
+		if (dvb_entry->video_pid_len) {
+			struct dvb_open_descriptor *video_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
+			if (!video_fd) {
+				ERROR("failed opening '%s'", args.demux_dev);
+				goto err;
+			}
+
+			fprintf(stderr, _("dvb_dev_set_bufsize: buffer set to %d\n"), DVB_BUF_SIZE);
+			dvb_dev_set_bufsize(video_fd, DVB_BUF_SIZE);
+
+			if (args.n_vpid >= dvb_entry->video_pid_len) {
+				args.n_vpid = 0;
+			}
+
+			for (int i = 0; i < dvb_entry->video_pid_len; i++) {
+				if (!args.extra_pids && i != args.n_vpid) {
+					continue;
+				}
+
+				if (args.silent < 2) {
+					fprintf(stderr, _("video%2$s pid %1$d\n"),
+						dvb_entry->video_pid[i], i == args.n_vpid ? "" : "+");
+				}
+
+				if (dvb_dev_dmx_set_pesfilter(video_fd, dvb_entry->video_pid[i],
+					i == args.n_vpid ? DMX_PES_VIDEO : DMX_PES_OTHER,
+					args.dvr ? DMX_OUT_TS_TAP : DMX_OUT_DECODER,
+					args.dvr ? 1024 * 1024 : 0) < 0) {
+					goto err;
+				}
+			}
+		}
+
+		if (dvb_entry->audio_pid_len) {
+			if (args.n_apid >= dvb_entry->audio_pid_len) {
+				args.n_apid = 0;
+			}
+
+			for (int i = 0; i < dvb_entry->audio_pid_len; i++) {
+				if (!args.extra_pids && i != args.n_apid) {
+					continue;
+				}
+
+				struct dvb_open_descriptor *audio_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
+				if (!audio_fd) {
+					ERROR("failed opening '%s'", args.demux_dev);
+					goto err;
+				}
+
+				if (args.silent < 2) {
+					fprintf(stderr, _("audio%2$s pid %1$d\n"),
+						dvb_entry->audio_pid[i], i == args.n_apid ? "" : "+");
+				}
+
+				if (dvb_dev_dmx_set_pesfilter(audio_fd, dvb_entry->audio_pid[i],
+						i == args.n_apid ? DMX_PES_AUDIO : DMX_PES_OTHER,
+						args.dvr ? DMX_OUT_TS_TAP : DMX_OUT_DECODER,
+						args.dvr ? 64 * 1024 : 0) < 0) {
+					goto err;
+				}
+			}
+		}
+
+		if (args.extra_pids && dvb_entry->other_el_pid_len) {
+			for (int i = dvb_entry->other_el_pid_len - 1; i >= 0; i--) {
+				struct dvb_open_descriptor * other_fd = dvb_dev_open(dvb, args.demux_dev, O_RDWR);
+				if (!other_fd) {
+					ERROR("failed opening '%s'", args.demux_dev);
+					goto err;
+				}
+
+				if (args.silent < 2) {
+					fprintf(stderr, _("other pid %d (%d)\n"),
+						dvb_entry->other_el_pid[i].pid, dvb_entry->other_el_pid[i].type);
+				}
+
+				if (dvb_dev_dmx_set_pesfilter(other_fd, dvb_entry->other_el_pid[i].pid, DMX_PES_OTHER,
+						args.dvr ? DMX_OUT_TS_TAP : DMX_OUT_DECODER,
+						args.dvr ? 64 * 1024 : 0) < 0) {
+					goto err;
+				}
+			}
+		}
 	}
 
-	if (((vpid >= 0 && vpid != 0x2000) || apid) && !args.rec_psi) {
+	if ((dvb_entry->video_pid_len || dvb_entry->audio_pid_len) && !args.all_pids && !args.rec_psi) {
 		printf(_("PMT record is disabled.\n"
 		         "Please notice that some streams can only be decoded with PMT data.\n"
 			 "Use '-p' option to also record PMT.\n"));
@@ -1397,6 +1444,10 @@ int main(int argc, char **argv)
 err:
 	dvb_dev_free(dvb);
 
+	if (dvb_file) {
+		dvb_file_free(dvb_file);
+	}
+
 	/*
 	 * Just to make Valgrind happier. It should be noticed
 	 * That, if an error happens or if the program exits via
-- 
2.17.1

-- 
Simon Arlott
