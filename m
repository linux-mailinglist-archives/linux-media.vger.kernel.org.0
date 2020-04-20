Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13D1B1510
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgDTSq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgDTSqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:55 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D67C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h69so5509959pgc.8
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9kZyrpoILwGtiw85vGBttiJNgt55hwAV1pgsqDbFCQs=;
        b=WHIwiCWExIKI07uceS4v/j8VPWBGIF6FgeiOlXYlIEL1+HCFhonY0exaDq98AmCiyJ
         opcKNpxPa42im3chQkHmXsbTgtNLKUnvWZVKsQlIV0zktIU0Bc0CWJAdqm0Q1KYNhAfd
         pnxx82MmSq/uii9OsjsLxSoJSOSywiJ/W6tX2ZoBZOyLbc7l2m6QBTGcNmt1u/kuaT3L
         ZK2NTUs9Wl91oGkcvLWulEMoLeuaBoSLW5abEecJrP475f7ZaexxKaJlQKI0zgnCtc6E
         SQzhemp/LUN/fCPrJ7YAOUdXCMYYEG26RxBUoIFFExDuOHal9M/+z61W4z19Xhk7QWcd
         nsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9kZyrpoILwGtiw85vGBttiJNgt55hwAV1pgsqDbFCQs=;
        b=HyDmCm3Qz7nf+A+rwagjFK91oMryAiRBIb2thp2ii7xg3KDs+WlmN4KvFmsWlpsX67
         sGXn+HrisykUBCNpcjHEFjnZzD4QHFzL7XE879qlFV9Zv3avB+2ERmviATunPfg7GwAh
         T7l4wJmlxBlqjR5Q9TdKVjF958uok1Ra9LfAfdwPOGlJEb3xHsxeJAcyEpWRaILXuHeF
         lMsftR2/f/m06aRu1LZmynkTzGwSllj8RJi31zbjD3l8OaGkGmykcpYNC8VF7Jpn1AFH
         r4CBrESAOkxorrn5PyZ4xSLnY72eBiu8k+4cYXIAkEEhLi+t30mZFB6wy+k5KSJg2vtR
         US1g==
X-Gm-Message-State: AGi0PuZ64SpG7HbRCnmdogT/P+azfmJlLw/Le1VV7ad9LRcmUXYdbwlA
        St5ia+dK7KYGuJq2SKwlS1vfplc0
X-Google-Smtp-Source: APiQypLv3Oj3O0za1qVNPfFcq9JG86gS3jr3+3E9k6GeZKiyFgvKVVtf+R6vt4uHDHB+4uq2FRP83w==
X-Received: by 2002:a63:ef02:: with SMTP id u2mr17741543pgh.21.1587408413915;
        Mon, 20 Apr 2020 11:46:53 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:53 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/7] treewide: fix wrong *cmp function usage
Date:   Mon, 20 Apr 2020 11:46:45 -0700
Message-Id: <20200420184649.4202-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with bugprone-suspicious-string-compare

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/countries.c                    |  2 +-
 lib/libdvbv5/dvb-dev-remote.c               |  4 ++--
 lib/libdvbv5/parse_string.c                 |  4 ++--
 lib/libv4l2rds/libv4l2rds.c                 |  6 +++---
 utils/cec-compliance/cec-test-adapter.cpp   |  2 +-
 utils/cec-compliance/cec-test.cpp           |  8 ++++----
 utils/cec-ctl/cec-ctl.cpp                   |  2 +-
 utils/common/media-info.cpp                 |  4 ++--
 utils/dvb/dvbv5-daemon.c                    |  2 +-
 utils/dvb/dvbv5-scan.c                      |  2 +-
 utils/ir-ctl/ir-ctl.c                       |  4 ++--
 utils/keytable/keytable.c                   |  6 +++---
 utils/libmedia_dev/get_media_devices.c      |  4 ++--
 utils/media-ctl/libmediactl.c               |  2 +-
 utils/media-ctl/libv4l2subdev.c             |  2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 18 +++++++++---------
 utils/v4l2-compliance/v4l2-test-buffers.cpp |  4 ++--
 utils/v4l2-compliance/v4l2-test-media.cpp   | 16 ++++++++--------
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-common.cpp          |  2 +-
 20 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/lib/libdvbv5/countries.c b/lib/libdvbv5/countries.c
index 609add0b..c5682365 100644
--- a/lib/libdvbv5/countries.c
+++ b/lib/libdvbv5/countries.c
@@ -395,7 +395,7 @@ enum dvb_country_t dvb_guess_user_country(void)
 			continue;
 
 		if (! strncmp(buf, "POSIX", MIN(strlen(buf), 5)) ||
-		    ! (strncmp(buf, "en", MIN(strlen(buf), 2)) && !isalpha(buf[2])) )
+		    ! (strncmp(buf, "en", MIN(strlen(buf), 2)) != 0 && !isalpha(buf[2])) )
 			continue;
 
 		buf = strdup(buf);
diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
index ebb1bdb7..643ca559 100644
--- a/lib/libdvbv5/dvb-dev-remote.c
+++ b/lib/libdvbv5/dvb-dev-remote.c
@@ -733,7 +733,7 @@ static void *receive_data(void *privdata)
 
 			handled = 1;
 
-			if (strcmp(msg->cmd, cmd)) {
+			if (strcmp(msg->cmd, cmd) != 0) {
 				dvb_logerr("msg #%d: Expecting '%s', got '%s'",
 						seq, msg->cmd, cmd);
 				free_msg(dvb, msg);
@@ -792,7 +792,7 @@ static int dvb_remote_get_version(struct dvb_device_priv *dvb)
 		goto error;
 	}
 
-	if (strcmp(version, daemon_version)) {
+	if (strcmp(version, daemon_version) != 0) {
 		dvb_logerr("Wrong version. Expecting '%s', received '%s'",
 			daemon_version, version);
 		ret = 0;
diff --git a/lib/libdvbv5/parse_string.c b/lib/libdvbv5/parse_string.c
index d354f497..b3518291 100644
--- a/lib/libdvbv5/parse_string.c
+++ b/lib/libdvbv5/parse_string.c
@@ -348,7 +348,7 @@ static void charset_conversion(struct dvb_v5_fe_parms *parms, char **dest, const
 		*p = '\0';
 
 		/* If desired charset is not UTF-8, prepare for conversion */
-		if (strcasecmp(parms->output_charset, "UTF-8")) {
+		if (strcasecmp(parms->output_charset, "UTF-8") != 0) {
 			tmp = (unsigned char *)*dest;
 			len = p - *dest;
 
@@ -391,7 +391,7 @@ void dvb_parse_string(struct dvb_v5_fe_parms *parms, char **dest, char **emph,
 	 * Strings in ISDB-S/T(JP) do not start with a charset identifier,
 	 * and can start with a control character (< 0x20).
 	 */
-	if (strcasecmp(type, "ARIB-STD-B24") && *src < 0x20) {
+	if (strcasecmp(type, "ARIB-STD-B24") != 0 && *src < 0x20) {
 		switch (*src) {
 		case 0x00:	type = "ISO-6937";		break;
 		case 0x01:	type = "ISO-8859-5";		break;
diff --git a/lib/libv4l2rds/libv4l2rds.c b/lib/libv4l2rds/libv4l2rds.c
index 2e67d060..a053adea 100644
--- a/lib/libv4l2rds/libv4l2rds.c
+++ b/lib/libv4l2rds/libv4l2rds.c
@@ -920,7 +920,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
 			if (segment == 0x0f) {
 				handle->rt_length = 64;
 				handle->valid_fields |= V4L2_RDS_RT;
-				if (memcmp(handle->rt, priv_state->new_rt, 64)) {
+				if (memcmp(handle->rt, priv_state->new_rt, 64) != 0) {
 					memcpy(handle->rt, priv_state->new_rt, 64);
 					updated_fields |= V4L2_RDS_RT;
 				}
@@ -937,7 +937,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
 				handle->rt_length = 32;
 				handle->valid_fields |= V4L2_RDS_RT;
 				updated_fields |= V4L2_RDS_RT;
-				if (memcmp(handle->rt, priv_state->new_rt, 32)) {
+				if (memcmp(handle->rt, priv_state->new_rt, 32) != 0) {
 					memcpy(handle->rt, priv_state->new_rt, 32);
 					updated_fields |= V4L2_RDS_RT;
 				}
@@ -954,7 +954,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
 			priv_state->new_rt[i] = '\0';
 			handle->rt_length = i;
 			handle->valid_fields |= V4L2_RDS_RT;
-			if (memcmp(handle->rt, priv_state->new_rt, handle->rt_length)) {
+			if (memcmp(handle->rt, priv_state->new_rt, handle->rt_length) != 0) {
 					memcpy(handle->rt, priv_state->new_rt,
 						handle->rt_length);
 					updated_fields |= V4L2_RDS_RT;
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 0675ccb7..27c742b3 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -193,7 +193,7 @@ static int testAdapLogAddrs(struct node *node)
 	fail_on_test(laddrs.log_addr_mask == 0);
 	for (unsigned i = 0; i < laddrs.num_log_addrs; i++) {
 		fail_on_test(laddrs.log_addr[i] == CEC_LOG_ADDR_INVALID);
-		fail_on_test(memcmp(laddrs.features[i], features, 4));
+		fail_on_test(memcmp(laddrs.features[i], features, 4) != 0);
 		fail_on_test(check_0(laddrs.features[i] + 4, 8));
 	}
 	for (unsigned i = laddrs.num_log_addrs; i < CEC_MAX_LOG_ADDRS; i++) {
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 9a08f54b..4aa54afc 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -116,7 +116,7 @@ int system_info_get_menu_lang(struct node *node, unsigned me, unsigned la, bool
 	if (cec_msg_status_is_abort(&msg))
 		return OK_PRESUMED;
 	cec_ops_set_menu_language(&msg, language);
-	fail_on_test(strcmp(node->remote[la].language, language));
+	fail_on_test(strcmp(node->remote[la].language, language) != 0);
 
 	return 0;
 }
@@ -319,7 +319,7 @@ int device_osd_transfer_give(struct node *node, unsigned me, unsigned la, bool i
 	char osd_name[15];
 	cec_ops_set_osd_name(&msg, osd_name);
 	fail_on_test(!osd_name[0]);
-	fail_on_test(strcmp(node->remote[la].osd_name, osd_name));
+	fail_on_test(strcmp(node->remote[la].osd_name, osd_name) != 0);
 	fail_on_test(msg.len != strlen(osd_name) + 2);
 
 	return 0;
@@ -937,11 +937,11 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		fail_on_test(timed_out_or_abort(&msg));
 		info = {};
 		cec_ops_tuner_device_status(&msg, &info);
-		if (memcmp(&info, &(*iter), sizeof(info))) {
+		if (memcmp(&info, &(*iter), sizeof(info)) != 0) {
 			log_tuner_service(info);
 			log_tuner_service(*iter);
 		}
-		fail_on_test(memcmp(&info, &(*iter), sizeof(info)));
+		fail_on_test(memcmp(&info, &(*iter), sizeof(info)) != 0);
 	}
 	printf("\t    Finished Channel Test\n");
 
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 3495883e..be37ae3c 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -975,7 +975,7 @@ static void analyze(const char *analyze_pin)
 		exit(1);
 	}
 	if (!fgets(s, sizeof(s), fanalyze) ||
-	    strcmp(s, "# cec-ctl --store-pin\n"))
+	    strcmp(s, "# cec-ctl --store-pin\n") != 0)
 		goto err;
 	line++;
 	if (!fgets(s, sizeof(s), fanalyze) ||
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index a5b429a0..b0f0bc41 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -187,7 +187,7 @@ std::string mi_get_devpath_from_dev_t(dev_t dev)
 		if (bytes <= 0)
 			break;
 		line[bytes - 1] = 0;
-		if (memcmp(line, "DEVNAME=", 8) || !line[8])
+		if ((memcmp(line, "DEVNAME=", 8) != 0) || !line[8])
 			continue;
 		devpath = "/dev/";
 		devpath += line + 8;
@@ -229,7 +229,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
 
 			if (bus_info &&
 			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
-			     strcmp(mdinfo.bus_info, bus_info))) {
+			     (strcmp(mdinfo.bus_info, bus_info) != 0))) {
 				close(media_fd);
 				continue;
 			}
diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
index ad1197b7..a17233b2 100644
--- a/utils/dvb/dvbv5-daemon.c
+++ b/utils/dvb/dvbv5-daemon.c
@@ -1203,7 +1203,7 @@ static int dev_set_parms(uint32_t seq, char *cmd, int fd,
 
 	if (!*new_lnb) {
 		par->lnb = NULL;
-	} else if (strcmp(old_lnb, new_lnb)) {
+	} else if (strcmp(old_lnb, new_lnb) != 0) {
 		int lnb = dvb_sat_search_lnb(new_lnb);
 
 		if (lnb < 0) {
diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
index 0a522433..30f8385f 100644
--- a/utils/dvb/dvbv5-scan.c
+++ b/utils/dvb/dvbv5-scan.c
@@ -288,7 +288,7 @@ static int run_scan(struct arguments *args, struct dvb_device *dvb)
 		 * to avoid linear search of LNB types for every entries.
 		 */
 		if (!args->lnb_name && entry->lnb &&
-		    (!parms->lnb || strcasecmp(entry->lnb, parms->lnb->alias)))
+		    (!parms->lnb || strcasecmp(entry->lnb, parms->lnb->alias) != 0))
 			parms->lnb = dvb_sat_get_lnb(dvb_sat_search_lnb(entry->lnb));
 
 		/*
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index ba454619..9f8c1c5d 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -739,7 +739,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 		struct raw_entry *re;
 
 		for (re = map->raw; re; re = re->next) {
-			if (strcmp(re->keycode, keycode))
+			if (strcmp(re->keycode, keycode) != 0)
 				continue;
 
 			count++;
@@ -760,7 +760,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 			const char *proto_str;
 			enum rc_proto proto;
 
-			if (strcmp(se->keycode, keycode))
+			if (strcmp(se->keycode, keycode) != 0)
 				continue;
 
 			count++;
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 4db91267..2c76f52b 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -360,7 +360,7 @@ static void add_bpf_protocol(struct bpf_protocol *new)
 	struct bpf_protocol *a;
 
 	for (a = bpf_protocol; a; a = a->next) {
-		if (strcmp(a->name, new->name))
+		if (strcmp(a->name, new->name) != 0)
 			continue;
 
 		if (compare_parameters(a->param, new->param) &&
@@ -2075,9 +2075,9 @@ int main(int argc, char *argv[])
 		int matches = 0;
 
 		for (cur = &cfg; cur->next; cur = cur->next) {
-			if ((!rc_dev.drv_name || strcasecmp(cur->driver, rc_dev.drv_name)) && strcasecmp(cur->driver, "*"))
+			if ((!rc_dev.drv_name || strcasecmp(cur->driver, rc_dev.drv_name) != 0) && strcasecmp(cur->driver, "*") != 0)
 				continue;
-			if ((!rc_dev.keytable_name || strcasecmp(cur->table, rc_dev.keytable_name)) && strcasecmp(cur->table, "*"))
+			if ((!rc_dev.keytable_name || strcasecmp(cur->table, rc_dev.keytable_name) != 0) && strcasecmp(cur->table, "*") != 0)
 				continue;
 
 			if (debug)
diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
index 491a94da..462b8b97 100644
--- a/utils/libmedia_dev/get_media_devices.c
+++ b/utils/libmedia_dev/get_media_devices.c
@@ -431,7 +431,7 @@ void display_media_devices(void *opaque)
 	char *prev = "";
 
 	for (i = 0; i < md->md_size; i++) {
-		if (strcmp(prev, md_ptr->device)) {
+		if (strcmp(prev, md_ptr->device) != 0) {
 			printf("\nDevice %s:\n\t", md_ptr->device);
 			prev = md_ptr->device;
 		}
@@ -584,7 +584,7 @@ const char *get_not_associated_device(void *opaque,
 		}
 		if (last_seek && !found)
 			continue;
-		if (strcmp(prev, md_ptr->device)) {
+		if (strcmp(prev, md_ptr->device) != 0) {
 			if (!skip && result)
 				break;
 			prev = md_ptr->device;
diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index 1fd6525b..6ef9a3f5 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -475,7 +475,7 @@ static int media_get_devname_sysfs(struct media_entity *entity)
 	if (strstr(p + 1, "dvb")) {
 		char *s = p + 1;
 
-		if (strncmp(s, "dvb", 3))
+		if (strncmp(s, "dvb", 3) != 0)
 			return -EINVAL;
 		s += 3;
 		p = strchr(s, '.');
diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 0d0afbe7..3b4490aa 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -433,7 +433,7 @@ static bool strhazit(const char *str, const char **p)
 {
 	int len = strlen(str);
 
-	if (strncmp(str, *p, len))
+	if (strncmp(str, *p, len) != 0)
 		return false;
 
 	for (*p += len; isspace(**p); ++*p);
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 938c7c35..0c3af294 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -620,14 +620,14 @@ static int testCap(struct node *node)
 	fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
 	fail_on_test(check_ustring(vcap.bus_info, sizeof(vcap.bus_info)));
 	// Check for valid prefixes
-	if (memcmp(vcap.bus_info, "usb-", 4) &&
-	    memcmp(vcap.bus_info, "PCI:", 4) &&
-	    memcmp(vcap.bus_info, "PCIe:", 5) &&
-	    memcmp(vcap.bus_info, "ISA:", 4) &&
-	    memcmp(vcap.bus_info, "I2C:", 4) &&
-	    memcmp(vcap.bus_info, "parport", 7) &&
-	    memcmp(vcap.bus_info, "platform:", 9) &&
-	    memcmp(vcap.bus_info, "rmi4:", 5))
+	if (memcmp(vcap.bus_info, "usb-", 4) != 0 &&
+	    memcmp(vcap.bus_info, "PCI:", 4) != 0 &&
+	    memcmp(vcap.bus_info, "PCIe:", 5) != 0 &&
+	    memcmp(vcap.bus_info, "ISA:", 4) != 0 &&
+	    memcmp(vcap.bus_info, "I2C:", 4) != 0 &&
+	    memcmp(vcap.bus_info, "parport", 7) != 0 &&
+	    memcmp(vcap.bus_info, "platform:", 9) != 0 &&
+	    memcmp(vcap.bus_info, "rmi4:", 5) != 0)
 		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
 	if (!node->media_bus_info.empty() &&
 	    node->media_bus_info != std::string(reinterpret_cast<const char *>(vcap.bus_info)))
@@ -834,7 +834,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
 	while ((ep = readdir(dp))) {
 		const char *name = ep->d_name;
 
-		if (!memcmp(name, "media", 5) && isdigit(name[5])) {
+		if ((!memcmp(name, "media", 5) != 0) && isdigit(name[5])) {
 			struct media_device_info mdi;
 			media_devname = std::string("/dev/") + name;
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 3b45711d..004de314 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1011,7 +1011,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 					     (orig_buf.flags & valid_output_flags));
 				if (buf.g_flags() & V4L2_BUF_FLAG_TIMECODE)
 					fail_on_test(memcmp(&buf.g_timecode(), &orig_buf.timecode,
-								sizeof(orig_buf.timecode)));
+								sizeof(orig_buf.timecode)) != 0);
 			}
 			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
 
@@ -1085,7 +1085,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 					(orig_buf.flags & valid_output_flags));
 			if (buf.g_flags() & V4L2_BUF_FLAG_TIMECODE)
 				fail_on_test(memcmp(&buf.g_timecode(), &orig_buf.timecode,
-							sizeof(orig_buf.timecode)));
+							sizeof(orig_buf.timecode)) != 0);
 		}
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
 		if (!count || stopped) {
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index bcd8a725..bcba3b15 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -53,14 +53,14 @@ int testMediaDeviceInfo(struct node *node)
 	} else {
 		fail_on_test(check_string(mdinfo.bus_info, sizeof(mdinfo.bus_info)));
 		// Check for valid prefixes
-		if (memcmp(mdinfo.bus_info, "usb-", 4) &&
-		    memcmp(mdinfo.bus_info, "PCI:", 4) &&
-		    memcmp(mdinfo.bus_info, "PCIe:", 5) &&
-		    memcmp(mdinfo.bus_info, "ISA:", 4) &&
-		    memcmp(mdinfo.bus_info, "I2C:", 4) &&
-		    memcmp(mdinfo.bus_info, "parport", 7) &&
-		    memcmp(mdinfo.bus_info, "platform:", 9) &&
-		    memcmp(mdinfo.bus_info, "rmi4:", 5))
+		if (memcmp(mdinfo.bus_info, "usb-", 4) != 0 &&
+		    memcmp(mdinfo.bus_info, "PCI:", 4) != 0 &&
+		    memcmp(mdinfo.bus_info, "PCIe:", 5) != 0 &&
+		    memcmp(mdinfo.bus_info, "ISA:", 4) != 0 &&
+		    memcmp(mdinfo.bus_info, "I2C:", 4) != 0 &&
+		    memcmp(mdinfo.bus_info, "parport", 7) != 0 &&
+		    memcmp(mdinfo.bus_info, "platform:", 9) != 0 &&
+		    memcmp(mdinfo.bus_info, "rmi4:", 5) != 0)
 			return fail("missing bus_info prefix ('%s')\n", mdinfo.bus_info);
 	}
 	fail_on_test(mdinfo.media_version == 0);
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 489639fb..998f63be 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -433,7 +433,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 	fail_on_test(crop.which != which);
 	fail_on_test(crop.pad != pad);
-	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
+	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)) != 0);
 
 	for (unsigned tgt = 0; targets[tgt].target != ~0U; tgt++) {
 		targets[tgt].found = false;
@@ -476,7 +476,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 				fail_on_test(crop.which != which);
 				fail_on_test(crop.pad != pad);
-				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
+				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)) != 0);
 			}
 		}
 		fail_on_test(!ret && targets[tgt].readonly);
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index f2997951..5dde39b9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -190,7 +190,7 @@ static void list_media_devices(const std::string &media_bus_info)
 		std::string s("/dev/");
 
 		s += ep->d_name;
-		if (memcmp(ep->d_name, "media", 5)) {
+		if (memcmp(ep->d_name, "media", 5) != 0) {
 			if (!is_v4l_dev(ep->d_name))
 				continue;
 			struct stat st;
-- 
2.25.2

