Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEB71AE766
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgDQVP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgDQVP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:15:27 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EAFC061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:15:26 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id z6so1397694plk.10
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6hlMD81Ug2ZwxUGSHugEANXBVnygiVYKtzVKVcf3o0=;
        b=hpWiPZxxSFl96FY5hBFsNbt/HzguQ5P/+8I+6ciiiREQL6QYQAgUgrUqVI1QfkDnZl
         PM/yT88tdnrBASO/Ui7T6MVA69n8SAjXjLNgD7pof+GFVRXt1XTQr7nDWuXhYWo8kO9j
         dbm44bb1McoOSM0A7cMgVB4sONEFYZs7b7XY1KkCTxllFA0ihjXjs2HN1YxifatkZA3Y
         S4cEREcMAvMfXhtxVkzsY5ulff9+n5H9TxqcFNSsiELmbbMekqtKoI+YPgMjYWYM5b5N
         okbbL45X3rg92nns1kibjRCRJnHNLsvXkcnblhhtWLzZCyhzW8nlB6QxJTcnRga6KH2U
         h/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6hlMD81Ug2ZwxUGSHugEANXBVnygiVYKtzVKVcf3o0=;
        b=qW0U2NL9N96/YPHqY4mKkElxhw4MesZtJWhZYgBGpE3BovOrcnCVcJJ5e5lYBQMDG6
         IHKArOMoOFUOscuUFjH4nNBC0d3vgLRLdJV9rULHdrJ1axBcukajoLRnBdGDfUFGR0qe
         9h27okjoWofpByoNFK0ynN/fsdo6ssqAe8R9sxndespYdcr9yUWUVKlW0w5GHueWbpbs
         KTVCIu4gVo1fWx5mvEW+91+OxOHcrfNcjLcnvAyrXhdjdGPx79G3aDGPEUxPxQmLP1JF
         Hl1t5WxOJYk5179vaHJFsIwwVXvAwyr1xAupBuAhQ7859pzOgI4Y2zpc/U/48GWTTAYN
         xqXQ==
X-Gm-Message-State: AGi0PuZbbPFK0rmerbXWLTi199tW+DJ3m3+jG2tT0eeEz2Wd6iEoVMgh
        Zrflp3khBY1EiVhGpmP8IXtWXLHHJjQ=
X-Google-Smtp-Source: APiQypIQsBGBzg8TAQUUrQIgclURy4ietxS3EE7JazlzQRMp1425Vkm7ZF9UarUFujeuTXOwBjh/Jw==
X-Received: by 2002:a17:90a:8c93:: with SMTP id b19mr6576873pjo.90.1587158125682;
        Fri, 17 Apr 2020 14:15:25 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id r13sm19552406pgj.9.2020.04.17.14.15.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:15:25 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: do not use return after else
Date:   Fri, 17 Apr 2020 14:15:24 -0700
Message-Id: <20200417211524.4430-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's readability-else-after-return

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/dvb-fe.c                   | 31 +++++++++++++------------
 lib/libv4l2rds/libv4l2rds.c             |  2 +-
 lib/libv4lconvert/ov518-decomp.c        |  8 +++----
 lib/libv4lconvert/spca561-decompress.c  |  4 ++--
 lib/libv4lconvert/tinyjpeg.c            |  2 +-
 utils/cec-compliance/cec-test-audio.cpp |  8 +++----
 utils/cec-compliance/cec-test-power.cpp |  8 +++----
 utils/cec-compliance/cec-test.cpp       | 31 ++++++++++++-------------
 utils/cec-follower/cec-follower.cpp     |  2 +-
 utils/cec-follower/cec-processing.cpp   |  4 ++--
 utils/common/keymap.c                   |  4 ++--
 utils/common/toml.c                     |  4 ++--
 utils/common/v4l-stream.c               |  2 +-
 utils/ir-ctl/ir-ctl.c                   |  3 +--
 utils/keytable/bpf_load.c               |  8 +++----
 utils/libmedia_dev/get_media_devices.c  |  2 +-
 utils/libv4l2util/v4l2_driver.c         |  2 +-
 utils/rds-ctl/rds-ctl.cpp               |  2 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp   |  4 ++--
 utils/v4l2-dbg/v4l2-dbg.cpp             |  3 +--
 20 files changed, 66 insertions(+), 68 deletions(-)

diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
index 5dcf492e..4ff64d58 100644
--- a/lib/libdvbv5/dvb-fe.c
+++ b/lib/libdvbv5/dvb-fe.c
@@ -640,9 +640,9 @@ const char *dvb_cmd_name(int cmd)
 {
 	if (cmd >= 0 && cmd < ARRAY_SIZE(dvb_v5_name))
 		return dvb_v5_name[cmd];
-	else if (cmd >= DTV_USER_COMMAND_START && cmd <= DTV_MAX_USER_COMMAND)
+	if (cmd >= DTV_USER_COMMAND_START && cmd <= DTV_MAX_USER_COMMAND)
 		return dvb_user_name[cmd - DTV_USER_COMMAND_START];
-	else if (cmd >= DTV_STAT_COMMAND_START && cmd <= DTV_MAX_STAT_COMMAND)
+	if (cmd >= DTV_STAT_COMMAND_START && cmd <= DTV_MAX_STAT_COMMAND)
 		return dvb_stat_name[cmd - DTV_STAT_COMMAND_START];
 	return NULL;
 }
@@ -651,7 +651,6 @@ const char *const *dvb_attr_names(int cmd)
 {
 	if (cmd >= 0 && cmd < DTV_MAX_COMMAND)
 		return dvb_v5_attr_names[cmd];
-
 	if (cmd >= DTV_USER_COMMAND_START && cmd <= DTV_MAX_USER_COMMAND)
 		return dvb_user_attr_names[cmd - DTV_USER_COMMAND_START];
 	return NULL;
@@ -1169,10 +1168,11 @@ static enum dvb_quality cnr_arr_to_qual(uint32_t modulation,
 		if (modulation == arr[i].modulation) {
 			if (cnr < arr[i].cnr_ok)
 				return DVB_QUAL_POOR;
-			else if (cnr < arr[i].cnr_good)
+
+			if (cnr < arr[i].cnr_good)
 				return DVB_QUAL_OK;
-			else
-				return DVB_QUAL_GOOD;
+
+			return DVB_QUAL_GOOD;
 
 		}
 	}
@@ -1367,10 +1367,11 @@ enum dvb_quality dvb_fe_retrieve_quality(struct dvb_v5_fe_parms *p,
 
 		if (ber > 1e-3)	/* FIXME: good enough???? */
 			return DVB_QUAL_POOR;
+
 		if (ber <= 2e-4)		/* BER = 10^-11 at TS */
 			return DVB_QUAL_GOOD;
-		else
-			qual = DVB_QUAL_OK;	/* OK or good */
+
+		qual = DVB_QUAL_OK;	/* OK or good */
 	}
 
 	cnr = dvb_fe_retrieve_stats_layer(&parms->p, DTV_STAT_CNR, layer);
@@ -1665,15 +1666,15 @@ static int __dvb_fe_snprintf_eng(char *buf, int len, float val, int metric)
 		if (signal > 0)
 			return snprintf(buf, len, " %.*fx10^%d", digits - 1,
 					val, exp);
-		else
-			return snprintf(buf, len, " -%.*fx10^%d", digits - 1,
+
+		return snprintf(buf, len, " -%.*fx10^%d", digits - 1,
 					val, exp);
-	} else {
-		if (signal > 0)
-			return snprintf(buf, len, " %.*f", digits - 1, val);
-		else
-			return snprintf(buf, len, " -%.*f", digits - 1, val);
 	}
+
+	if (signal > 0)
+		return snprintf(buf, len, " %.*f", digits - 1, val);
+
+	return snprintf(buf, len, " -%.*f", digits - 1, val);
 }
 
 int dvb_fe_snprintf_eng(char *buf, int len, float val)
diff --git a/lib/libv4l2rds/libv4l2rds.c b/lib/libv4l2rds/libv4l2rds.c
index 5fa156a2..2e67d060 100644
--- a/lib/libv4l2rds/libv4l2rds.c
+++ b/lib/libv4l2rds/libv4l2rds.c
@@ -306,7 +306,7 @@ static bool rds_add_tmc_af(struct rds_private_state *priv_state)
 	}
 
 	/* mapped frequency pair */
-	else if (variant == 7) {
+	if (variant == 7) {
 		/* check if there's already a frequency mapped to the new tuning
 		 * frequency, update the mapped frequency in this case */
 		for (int i = 0; i < afi->mapped_af_size; i++) {
diff --git a/lib/libv4lconvert/ov518-decomp.c b/lib/libv4lconvert/ov518-decomp.c
index 91d908c4..0fdbf0ed 100644
--- a/lib/libv4lconvert/ov518-decomp.c
+++ b/lib/libv4lconvert/ov518-decomp.c
@@ -653,7 +653,7 @@ huffmanDecoderY(int *C, int *pIn, struct comp_info *cinfo)
 
 		if (skip == -1) {
 			break;
-		} else if (skip == 0) {
+		} if (skip == 0) {
 			C[i++] = coeff;
 		} else if (skip == 16) {
 			k = 16;
@@ -697,7 +697,7 @@ huffmanDecoderUV(int *C, int *pIn, struct comp_info *cinfo)
 
 		if (skip == -1) {
 			break;
-		} else if (skip == 0) {
+		} if (skip == 0) {
 			C[i++] = coeff;
 		} else if (skip == 16) {
 			k = 16;
@@ -1327,8 +1327,8 @@ decompress420NoMMXOV518(unsigned char	 *pIn,
 	/* Did we decode enough? */
 	if (cinfo->bytes >= cinfo->rawLen - (897 + 64))
 		return 0;
-	else
-		return 1;
+
+	return 1;
 }
 
 /* Get quantization tables from input
diff --git a/lib/libv4lconvert/spca561-decompress.c b/lib/libv4lconvert/spca561-decompress.c
index 965943c6..7159d7ff 100644
--- a/lib/libv4lconvert/spca561-decompress.c
+++ b/lib/libv4lconvert/spca561-decompress.c
@@ -110,8 +110,8 @@ static int fun_C(int *bitfill, int gkw)
 	if (gkw == 0xfe) {
 		if (nbits(bitfill, 1) == 0)
 			return 7;
-		else
-			return -8;
+
+		return -8;
 	}
 
 	if (gkw != 0xff)
diff --git a/lib/libv4lconvert/tinyjpeg.c b/lib/libv4lconvert/tinyjpeg.c
index 25e919d6..070c92db 100644
--- a/lib/libv4lconvert/tinyjpeg.c
+++ b/lib/libv4lconvert/tinyjpeg.c
@@ -393,7 +393,7 @@ static void process_Huffman_data_unit(struct jdec_private *priv, int component)
 		if (size_val == 0) { /* RLE */
 			if (count_0 == 0)
 				break;	/* EOB found, go out */
-			else if (count_0 == 0xF)
+			if (count_0 == 0xF)
 				j += 16;	/* skip 16 zeros */
 		} else {
 			j += count_0;	/* skip count_0 zeroes */
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index af472bf4..576d59c6 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -224,11 +224,11 @@ static int arc_initiate_rx(struct node *node, unsigned me, unsigned la, bool int
 			announce("The device supports ARC but is not ready to initiate.");
 			return 0;
 		}
-		else {
-			warn("Device responded Feature Abort with unexpected abort reason. Assuming no ARC support.\n");
-			unsupported = true;
-		}
+
+		warn("Device responded Feature Abort with unexpected abort reason. Assuming no ARC support.\n");
+		unsupported = true;
 	}
+
 	if (unsupported) {
 		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].source_has_arc_rx);
 		return OK_NOT_SUPPORTED;
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 90a62ddc..2758c36d 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -166,8 +166,8 @@ static int one_touch_play_view_on_wakeup(struct node *node, unsigned me, unsigne
 
 	if (interactive)
 		return 0;
-	else
-		return OK_PRESUMED;
+
+	return OK_PRESUMED;
 }
 
 static int one_touch_play_image_view_on_wakeup(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -203,8 +203,8 @@ static int one_touch_play_view_on_change(struct node *node, unsigned me, unsigne
 
 	if (interactive)
 		return 0;
-	else
-		return OK_PRESUMED;
+
+	return OK_PRESUMED;
 }
 
 static int one_touch_play_image_view_on_change(struct node *node, unsigned me, unsigned la, bool interactive)
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 16e81bdb..0ac43afe 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -352,9 +352,9 @@ static int osd_string_set_default(struct node *node, unsigned me, unsigned la, b
 			(node->remote[la].dev_features & CEC_OP_FEAT_DEV_HAS_SET_OSD_STRING));
 	if (unrecognized_op(&msg))
 		return OK_NOT_SUPPORTED;
-	else if (refused(&msg))
+	if (refused(&msg))
 		return OK_REFUSED;
-	else if (cec_msg_status_is_abort(&msg)) {
+	if (cec_msg_status_is_abort(&msg)) {
 		warn("The device is in an unsuitable state or cannot display the complete message.\n");
 		unsuitable = true;
 	}
@@ -402,8 +402,8 @@ static int osd_string_set_until_clear(struct node *node, unsigned me, unsigned l
 
 	if (interactive)
 		return 0;
-	else
-		return OK_PRESUMED;
+
+	return OK_PRESUMED;
 }
 
 static int osd_string_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -480,8 +480,8 @@ static int routing_control_active_source(struct node *node, unsigned me, unsigne
 
 	if (interactive)
 		return 0;
-	else
-		return OK_PRESUMED;
+
+	return OK_PRESUMED;
 }
 
 static int routing_control_req_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -529,9 +529,8 @@ static int routing_control_set_stream_path(struct node *node, unsigned me, unsig
 
 	if (interactive || node->remote[la].cec_version >= CEC_OP_CEC_VERSION_2_0)
 		return 0;
-	else
-		return OK_PRESUMED;
-	return 0;
+
+	return OK_PRESUMED;
 }
 
 static struct remote_subtest routing_control_subtests[] = {
@@ -900,10 +899,10 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 			if (abort_reason(&msg) == CEC_OP_ABORT_REFUSED) {
 				warn("Tuner step increment does not wrap.\n");
 				break;
-			} else {
-				warn("Tuner at end of service list did not receive feature abort refused.\n");
-				break;
 			}
+
+			warn("Tuner at end of service list did not receive feature abort refused.\n");
+			break;
 		}
 		cec_msg_init(&msg, me, la);
 		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
@@ -1050,8 +1049,8 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
 		return OK_PRESUMED;
 	if (timed_out(&msg))
 		return OK_PRESUMED;
-	else
-		return 0;
+
+	return 0;
 }
 
 static int one_touch_rec_status(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1332,8 +1331,8 @@ static int cdc_hec_discover(struct node *node, unsigned me, unsigned la, bool pr
 		if (msg.msg[1] == CEC_MSG_FEATURE_ABORT) {
 			if (from == la)
 				return fail("Device replied Feature Abort to broadcast message\n");
-			else
-				warn("Device %d replied Feature Abort to broadcast message\n", cec_msg_initiator(&msg));
+
+			warn("Device %d replied Feature Abort to broadcast message\n", cec_msg_initiator(&msg));
 		}
 		if (msg.msg[1] != CEC_MSG_CDC_MESSAGE)
 			continue;
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index c9cd18d1..6ccd2ae2 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -227,7 +227,7 @@ std::string audio_format_id_code2s(__u8 audio_format_id, __u8 audio_format_code)
 {
 	if (audio_format_id == 0)
 		return audio_format_code2s(audio_format_code);
-	else if (audio_format_id == 1)
+	if (audio_format_id == 1)
 		return extension_type_code2s(audio_format_code);
 	return "Invalid";
 }
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 58af25a1..75000b73 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -692,8 +692,8 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 			   signalize that we support SAC. */
 			if (cec_has_tv(1 << me))
 				return;
-			else
-				break;
+
+			break;
 		}
 		cec_ops_set_system_audio_mode(&msg, &system_audio_status);
 		if (system_audio_status == CEC_OP_SYS_AUD_STATUS_ON)
diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index fa8f256f..47d36152 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -527,8 +527,8 @@ error_t parse_keymap(char *fname, struct keymap **keymap, bool verbose)
 
 	if (len >= 5 && strcasecmp(fname + len - 5, ".toml") == 0)
 		return parse_toml_keymap(fname, keymap, verbose);
-	else
-		return parse_plain_keymap(fname, keymap, verbose);
+
+	return parse_plain_keymap(fname, keymap, verbose);
 }
 
 int keymap_param(struct keymap *map, const char *name, int fallback)
diff --git a/utils/common/toml.c b/utils/common/toml.c
index 2a9f3dac..dc9868a2 100644
--- a/utils/common/toml.c
+++ b/utils/common/toml.c
@@ -1697,7 +1697,7 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
         for (i = 0; i < 10; i++, p++) {
             int xx = *p;
             if (xx == '-') {
-                if (i == 4 || i == 7) continue; else return -1;
+                if (i == 4 || i == 7) continue; return -1;
             }
             if (! ('0' <= xx && xx <= '9')) return -1;
             val = val * 10 + (xx - '0');
@@ -1724,7 +1724,7 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
     for (i = 0; i < 8; i++, p++) {
         int xx = *p;
         if (xx == ':') {
-            if (i == 2 || i == 5) continue; else return -1;
+            if (i == 2 || i == 5) continue; return -1;
         }
         if (! ('0' <= xx && xx <= '9')) return -1;
         val = val * 10 + (xx - '0');
diff --git a/utils/common/v4l-stream.c b/utils/common/v4l-stream.c
index c2f2abce..ae283a9c 100644
--- a/utils/common/v4l-stream.c
+++ b/utils/common/v4l-stream.c
@@ -88,7 +88,7 @@ void rle_decompress(__u8 *b, unsigned size, unsigned rle_size, unsigned bpl)
 			i += 4;
 			next_line = dst + bpl / 4;
 			continue;
-		} else if (v == magic_x) {
+		} if (v == magic_x) {
 			v = *++p;
 			n = ntohl(*++p);
 			i += 8;
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index ef399808..ba454619 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -1159,9 +1159,8 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 			// is meaningless, maybe fix the kernel?
 			if (leading_space && msg == LIRC_MODE2_SPACE)
 				continue;
-			else
-				leading_space = false;
 
+			leading_space = false;
 			if (args->oneshot &&
 				(msg == LIRC_MODE2_TIMEOUT ||
 				(msg == LIRC_MODE2_SPACE && val > 19000))) {
diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index 818dedef..9f64cf4e 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -266,7 +266,7 @@ static int parse_relo_and_apply(struct bpf_file *bpf_file, GElf_Shdr *shdr,
 			       insn_idx);
 			return 1;
 		}
-		else if (sym.st_shndx == bpf_file->dataidx || sym.st_shndx == bpf_file->bssidx) {
+		if (sym.st_shndx == bpf_file->dataidx || sym.st_shndx == bpf_file->bssidx) {
 			const char *raw = NULL;
 			int value = 0;
 
@@ -310,10 +310,10 @@ static int cmp_symbols(const void *l, const void *r)
 
 	if (lsym->st_value < rsym->st_value)
 		return -1;
-	else if (lsym->st_value > rsym->st_value)
+	if (lsym->st_value > rsym->st_value)
 		return 1;
-	else
-		return 0;
+
+	return 0;
 }
 
 static int load_elf_maps_section(struct bpf_file *bpf_file)
diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
index be2532d5..9169d74a 100644
--- a/utils/libmedia_dev/get_media_devices.c
+++ b/utils/libmedia_dev/get_media_devices.c
@@ -240,7 +240,7 @@ static int add_snd_class(struct media_device_entry *md)
 	if (strstr(md->node, "timer")) {
 		md->type = MEDIA_SND_TIMER;
 		return 0;
-	} else if (strstr(md->node, "seq")) {
+	} if (strstr(md->node, "seq")) {
 		md->type = MEDIA_SND_SEQ;
 		return 0;
 	} if (strstr(md->node, "card")) {
diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index 67982047..342e203c 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -436,7 +436,7 @@ int v4l2_gettryset_fmt_cap (struct v4l2_driver *drv, enum v4l2_direction dir,
 			perror("VIDIOC_G_FMT failed\n");
 		}
 		return ret;
-	} else if (dir & (~(V4L2_TRY|V4L2_SET)) ) {
+	} if (dir & (~(V4L2_TRY|V4L2_SET)) ) {
 		perror ("Invalid direction\n");
 		return EINVAL;
 	}
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index f6b34a7a..b1e076fb 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -691,7 +691,7 @@ static void read_rds(struct v4l2_rds *handle, const int fd, const int wait_limit
 			if (byte_cnt == 0) {
 				printf("\nEnd of input file reached \n");
 				break;
-			} else if(++error_cnt > 2) {
+			} if(++error_cnt > 2) {
 				fprintf(stderr, "\nError reading from "
 					"device (no RDS data available)\n");
 				break;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 00affd1a..f0da85c6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2490,7 +2490,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		if (rc == 0) {
 			fprintf(stderr, "Timeout when waiting for media request\n");
 			return;
-		} else if (rc < 0) {
+		} if (rc < 0) {
 			fprintf(stderr, "Unable to select media request: %s\n",
 				strerror(errno));
 			return;
@@ -2654,7 +2654,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 			      V4L2_CAP_VIDEO_M2M_MPLANE))) {
 		fprintf(stderr, "unsupported capture stream type\n");
 		return;
-	} else if (!(out_capabilities & (V4L2_CAP_VIDEO_OUTPUT |
+	} if (!(out_capabilities & (V4L2_CAP_VIDEO_OUTPUT |
 					 V4L2_CAP_VIDEO_OUTPUT_MPLANE |
 					 V4L2_CAP_VIDEO_M2M |
 					 V4L2_CAP_VIDEO_M2M_MPLANE))) {
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 41f94fff..8fb70775 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -287,9 +287,8 @@ static void print_regs(int fd, struct v4l2_dbg_register *reg, unsigned long min,
 		if (ioctl(fd, VIDIOC_DBG_G_REGISTER, reg) < 0) {
 			perror("ioctl: VIDIOC_DBG_G_REGISTER failed\n");
 			break;
-		} else {
-			printf("%0*llx ", 2 * stride, reg->val);
 		}
+		printf("%0*llx ", 2 * stride, reg->val);
 		usleep(1);
 	}
 	printf("\n");
-- 
2.25.2

