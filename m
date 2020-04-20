Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6511B1517
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgDTSrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbgDTSqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:55 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A165C061A0F
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id o10so2276695pgb.6
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4SWfbj2hB9nx5sjtD4Q6O5QT64jYtShIQdeZ2+yrV6c=;
        b=X3KevWd5PAIuMxz18kE4JDIjep2NwfBEZ1xm55WkdK5BzO0ypEs7f+RMxrSAOj/436
         /OjmU9i5lsw3014vDndcKiHiUbamxtBYMNfOFycJIXFVQ+qt0e9nUO5lnaYhtIaHgfQj
         rILuT6qxnGxR/2nphY6kdP8dSQBQJNqpFtCE4lBa2Ar2aQez/BTQgHwx/ZFYg5er8vIH
         xbm2iyH0umLz48A4JjDZqWtrb4fBs+xA4rpY25LSXwfrMMgL9uyGav+4SX3CvkGWEDbn
         pEkpkwaaByUVYZnN+7f6B08p/riRB9Qv5TedcGy4q/tj85Wx5pksbQkQ6pli4z5omxPJ
         fPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4SWfbj2hB9nx5sjtD4Q6O5QT64jYtShIQdeZ2+yrV6c=;
        b=rpCYthfcXlu+2vF3B26+TIYNL5BO5fFblfMflJxd5+x/M/djYDZgV5xhTfnCCH0Jhs
         Nsf3ly9Z9tG9TQHqqwisKst39bbG4OBWcLV4SJBd9EhTvk9L1AAIfF4+aSizwk6w5cc3
         3x/0wNS80MeGi5KtHf/x/7MbsQuHRHMe/Q1NaIbJXcMV16sAVToo6y81Tbjfj2gn97fu
         qDwsVSiCmOaVrIukLhyeA8sJn6qxtUhtZfTmz4n/oEC0Z4NsiTegcf3vqZgi21X8eEHS
         5G3H/XrF++5srwYOco25toA9j2NqY7B9O3uCEjCSuuSFjKV9buNW+vZg96g9CSRRnx7S
         mBJw==
X-Gm-Message-State: AGi0Puaphhpj5wkkU4dMg4C2Po3ck7JVZJzGeEiK9tAXOO5mlaUwV/3n
        pzsuKe1CiBt2Q/vaNTN06af5Zl0t
X-Google-Smtp-Source: APiQypK7CP2wt9ZuqJW7TAmp9sQiLf6P7nLNawNZtzvU/7GMkz+HhDNq9FTx160gT3y5o/BBr/T31A==
X-Received: by 2002:a62:e307:: with SMTP id g7mr17204540pfh.197.1587408412728;
        Mon, 20 Apr 2020 11:46:52 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:52 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/7] treewide: replace C casts with C++
Date:   Mon, 20 Apr 2020 11:46:44 -0700
Message-Id: <20200420184649.4202-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also removed usedless casts.

Found with clang-tidy's google-readability-casting

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/tables/mgt.c                     |  2 +-
 lib/libdvbv5/tables/nit.c                     |  4 +-
 lib/libdvbv5/tables/pmt.c                     |  2 +-
 lib/libdvbv5/tables/vct.c                     |  2 +-
 utils/cec-compliance/cec-compliance.cpp       | 12 ++---
 utils/cec-compliance/cec-test.cpp             |  2 +-
 utils/cec-ctl/cec-ctl.cpp                     |  4 +-
 utils/cec-follower/cec-follower.cpp           |  8 ++--
 utils/cec-follower/cec-tuner.cpp              |  2 +-
 utils/cx18-ctl/cx18-ctl.c                     | 10 ++---
 utils/ivtv-ctl/ivtv-ctl.c                     |  2 +-
 utils/libcecutil/cec-log.cpp                  |  2 +-
 utils/libcecutil/cec-parse.cpp                |  2 +-
 utils/rds-ctl/rds-ctl.cpp                     | 12 ++---
 utils/v4l2-compliance/v4l2-compliance.cpp     | 14 +++---
 utils/v4l2-compliance/v4l2-test-buffers.cpp   | 22 +++++-----
 utils/v4l2-compliance/v4l2-test-colors.cpp    |  4 +-
 utils/v4l2-compliance/v4l2-test-controls.cpp  | 12 ++---
 utils/v4l2-compliance/v4l2-test-formats.cpp   |  6 +--
 .../v4l2-test-input-output.cpp                |  4 +-
 utils/v4l2-compliance/v4l2-test-media.cpp     |  4 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp            | 20 ++++-----
 utils/v4l2-ctl/v4l2-ctl-edid.cpp              |  6 +--
 utils/v4l2-ctl/v4l2-ctl-io.cpp                |  4 +-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp              |  8 ++--
 utils/v4l2-ctl/v4l2-ctl-modes.cpp             | 12 ++---
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp           | 10 ++---
 utils/v4l2-ctl/v4l2-ctl-stds.cpp              | 16 +++----
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp         | 44 +++++++++----------
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp            |  4 +-
 utils/v4l2-ctl/v4l2-ctl.cpp                   | 12 ++---
 utils/v4l2-dbg/v4l2-dbg.cpp                   |  4 +-
 32 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/lib/libdvbv5/tables/mgt.c b/lib/libdvbv5/tables/mgt.c
index 784e70f4..828c9e7b 100644
--- a/lib/libdvbv5/tables/mgt.c
+++ b/lib/libdvbv5/tables/mgt.c
@@ -121,7 +121,7 @@ void atsc_table_mgt_free(struct atsc_table_mgt *mgt)
 {
 	struct atsc_table_mgt_table *table = mgt->table;
 
-	dvb_desc_free((struct dvb_desc **) &mgt->descriptor);
+	dvb_desc_free(&mgt->descriptor);
 	while (table) {
 		struct atsc_table_mgt_table *tmp = table;
 
diff --git a/lib/libdvbv5/tables/nit.c b/lib/libdvbv5/tables/nit.c
index c343d4e9..ab29d319 100644
--- a/lib/libdvbv5/tables/nit.c
+++ b/lib/libdvbv5/tables/nit.c
@@ -133,9 +133,9 @@ ssize_t dvb_table_nit_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
 void dvb_table_nit_free(struct dvb_table_nit *nit)
 {
 	struct dvb_table_nit_transport *transport = nit->transport;
-	dvb_desc_free((struct dvb_desc **) &nit->descriptor);
+	dvb_desc_free(&nit->descriptor);
 	while (transport) {
-		dvb_desc_free((struct dvb_desc **) &transport->descriptor);
+		dvb_desc_free(&transport->descriptor);
 		struct dvb_table_nit_transport *tmp = transport;
 		transport = transport->next;
 		free(tmp);
diff --git a/lib/libdvbv5/tables/pmt.c b/lib/libdvbv5/tables/pmt.c
index 5ba0bb2e..1234bdfd 100644
--- a/lib/libdvbv5/tables/pmt.c
+++ b/lib/libdvbv5/tables/pmt.c
@@ -147,7 +147,7 @@ void dvb_table_pmt_free(struct dvb_table_pmt *pmt)
 		stream = stream->next;
 		free(tmp);
 	}
-	dvb_desc_free((struct dvb_desc **) &pmt->descriptor);
+	dvb_desc_free(&pmt->descriptor);
 	free(pmt);
 }
 
diff --git a/lib/libdvbv5/tables/vct.c b/lib/libdvbv5/tables/vct.c
index 1ecd61f8..5d37ed58 100644
--- a/lib/libdvbv5/tables/vct.c
+++ b/lib/libdvbv5/tables/vct.c
@@ -160,7 +160,7 @@ void atsc_table_vct_free(struct atsc_table_vct *vct)
 		channel = channel->next;
 		free(tmp);
 	}
-	dvb_desc_free((struct dvb_desc **) &vct->descriptor);
+	dvb_desc_free(&vct->descriptor);
 
 	free(vct);
 }
diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 003b49a2..b665303e 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -378,7 +378,7 @@ std::string short_audio_desc2s(const struct short_audio_desc &sad)
 		oss << audio_format_code2s(sad.format_code);
 	else
 		oss << extension_type_code2s(sad.extension_type_code);
-	oss << ", " << (int)sad.num_channels << " channels";
+	oss << ", " << static_cast<int>(sad.num_channels) << " channels";
 
 	oss << ", sampling rates (kHz): ";
 	if (sad.sample_freq_mask & SAD_SAMPLE_FREQ_MASK_32)
@@ -631,7 +631,7 @@ std::string opcode2s(const struct cec_msg *msg)
 
 		if (name)
 			return name;
-		oss << "CDC: 0x" << std::hex << (unsigned)cdc_opcode;
+		oss << "CDC: 0x" << std::hex << static_cast<unsigned>(cdc_opcode);
 		return oss.str();
 	}
 
@@ -639,7 +639,7 @@ std::string opcode2s(const struct cec_msg *msg)
 
 	if (name)
 		return name;
-	oss << "0x" << std::hex << (unsigned)opcode;
+	oss << "0x" << std::hex << static_cast<unsigned>(opcode);
 	return oss.str();
 }
 
@@ -648,7 +648,7 @@ int cec_named_ioctl(struct node *node, const char *name,
 {
 	int retval;
 	int e;
-	struct cec_msg *msg = (struct cec_msg *)parm;
+	struct cec_msg *msg = static_cast<struct cec_msg *>(parm);
 	__u8 opcode = 0;
 	std::string opname;
 
@@ -802,7 +802,7 @@ const char *ok(int res)
 
 int check_0(const void *p, int len)
 {
-	const __u8 *q = (const __u8 *)p;
+	const __u8 *q = static_cast<const __u8 *>(p);
 
 	while (len--)
 		if (*q++)
@@ -1175,7 +1175,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		if (!option_index) {
 			for (i = 0; long_options[i].val; i++) {
 				if (long_options[i].val == ch) {
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 0ac43afe..9a08f54b 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -613,7 +613,7 @@ static int dev_menu_ctl_request(struct node *node, unsigned me, unsigned la, boo
 }
 
 static struct remote_subtest dev_menu_ctl_subtests[] = {
-	{ "Menu Request", (__u16)~CEC_LOG_ADDR_MASK_TV, dev_menu_ctl_request },
+	{ "Menu Request", static_cast<__u16>(~CEC_LOG_ADDR_MASK_TV), dev_menu_ctl_request },
 	{ "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_pressed },
 	{ "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_released },
 };
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index ae668806..3495883e 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -386,7 +386,7 @@ std::string ts2s(double ts)
 		sprintf(buf, "%10.06f", ts);
 		return buf;
 	}
-	return ts2s((__u64)(ts * 1000000000.0));
+	return ts2s(static_cast<__u64>(ts * 1000000000.0));
 }
 
 static __u64 current_ts()
@@ -1875,7 +1875,7 @@ int main(int argc, char **argv)
 
 		cec_msg_init(&msg, 0, 0);
 		msg.msg[0] = options[OptTo] ? to : 0xf0;
-		options[(int)ch] = 1;
+		options[ch] = 1;
 
 		switch (ch) {
 		case OptHelp:
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 6ccd2ae2..12bb5f15 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -244,7 +244,7 @@ std::string opcode2s(const struct cec_msg *msg)
 
 		if (name)
 			return name;
-		oss << "CDC: 0x" << std::hex << (unsigned)cdc_opcode;
+		oss << "CDC: 0x" << std::hex << static_cast<unsigned>(cdc_opcode);
 		return oss.str();
 	}
 
@@ -252,7 +252,7 @@ std::string opcode2s(const struct cec_msg *msg)
 
 	if (name)
 		return name;
-	oss << "0x" << std::hex << (unsigned)opcode;
+	oss << "0x" << std::hex << static_cast<unsigned>(opcode);
 	return oss.str();
 }
 
@@ -270,7 +270,7 @@ int cec_named_ioctl(int fd, const char *name,
 			name, retval, strerror(e));
 
 	if (!retval) {
-		const struct cec_msg *msg = (const struct cec_msg *)parm;
+		const struct cec_msg *msg = static_cast<const struct cec_msg *>(parm);
 
 		/* Update the timestamp whenever we successfully transmit to an LA,
 		   or whenever we receive something from the LA */
@@ -340,7 +340,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		if (!option_index) {
 			for (i = 0; long_options[i].val; i++) {
 				if (long_options[i].val == ch) {
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index bf33c440..aa19f55d 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -402,7 +402,7 @@ static bool digital_update_tuner_dev_info(struct node *node, int idx,
 	default:
 		break;
 	}
-	if (node->state.service_idx != (unsigned)idx && node->state.tuner_report_changes) {
+	if (node->state.service_idx != static_cast<unsigned>(idx) && node->state.tuner_report_changes) {
 		cec_msg_set_reply_to(msg, msg);
 		cec_msg_tuner_device_status(msg, &node->state.tuner_dev_info);
 		transmit(node, msg);
diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
index ba95fffe..3ce7c018 100644
--- a/utils/cx18-ctl/cx18-ctl.c
+++ b/utils/cx18-ctl/cx18-ctl.c
@@ -255,7 +255,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		switch (ch) {
 		case OptHelp:
 			usage();
@@ -344,22 +344,22 @@ int main(int argc, char **argv)
 		reg.match.type = V4L2_CHIP_MATCH_HOST;
 		reg.match.addr = 0;
 		reg.reg = CX18_REG_GPIO_DIR1;
-		reg.val = (unsigned)((gpio_dir & 0xffff) << 16);
+		reg.val = ((gpio_dir & 0xffff) << 16);
 		if (gpio_set_dir && doioctl(fd, VIDIOC_DBG_S_REGISTER, &reg,
 			"VIDIOC_DBG_S_REGISTER") == 0)
 			printf("GPIO dir 1 set to 0x%08llx\n", reg.val);
 		reg.reg = CX18_REG_GPIO_DIR2;
-		reg.val = (unsigned)(gpio_dir & 0xffff0000);
+		reg.val = (gpio_dir & 0xffff0000);
 		if (gpio_set_dir && doioctl(fd, VIDIOC_DBG_S_REGISTER, &reg,
 			"VIDIOC_DBG_S_REGISTER") == 0)
 			printf("GPIO dir 2 set to 0x%08llx\n", reg.val);
 		reg.reg = CX18_REG_GPIO_OUT1;
-		reg.val = (unsigned)((gpio_dir & 0xffff) << 16) | (gpio_out & 0xffff);
+		reg.val = ((gpio_dir & 0xffff) << 16) | (gpio_out & 0xffff);
 		if (doioctl(fd, VIDIOC_DBG_S_REGISTER, &reg,
 			"VIDIOC_DBG_S_REGISTER") == 0)
 			printf("GPIO out 1 set to 0x%08llx\n", reg.val);
 		reg.reg = CX18_REG_GPIO_OUT2;
-		reg.val = (unsigned)(gpio_dir & 0xffff0000) | (gpio_out >> 16);
+		reg.val = (gpio_dir & 0xffff0000) | (gpio_out >> 16);
 		if (doioctl(fd, VIDIOC_DBG_S_REGISTER, &reg,
 			"VIDIOC_DBG_S_REGISTER") == 0)
 			printf("GPIO out 2 set to 0x%08llx\n", reg.val);
diff --git a/utils/ivtv-ctl/ivtv-ctl.c b/utils/ivtv-ctl/ivtv-ctl.c
index adf8d11e..9923827e 100644
--- a/utils/ivtv-ctl/ivtv-ctl.c
+++ b/utils/ivtv-ctl/ivtv-ctl.c
@@ -310,7 +310,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		switch (ch) {
 		case OptSetYuvMode:
 		    {
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index f83839b5..d4d5c290 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -187,7 +187,7 @@ static void log_features(const struct cec_arg *arg,
 			 const char *arg_name, const __u8 *p)
 {
 	do {
-		log_arg(arg, arg_name, (__u32)((*p) & ~CEC_OP_FEAT_EXT));
+		log_arg(arg, arg_name, static_cast<__u32>((*p) & ~CEC_OP_FEAT_EXT));
 	} while ((*p++) & CEC_OP_FEAT_EXT);
 }
 
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index bb73fe57..5fffcce7 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -162,7 +162,7 @@ static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
 
 int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
 {
-	int opt = getsubopt(subs, (char * const *)subopts, value);
+	int opt = getsubopt(subs, const_cast<char * const *>(subopts), value);
 
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 770497d4..2d561481 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -314,9 +314,9 @@ static void print_devices(dev_vec files)
 			continue;
 		doioctl(fd, VIDIOC_QUERYCAP, &vcap);
 		close(fd);
-		bus_info = (const char *)vcap.bus_info;
+		bus_info = reinterpret_cast<const char *>(vcap.bus_info);
 	if (cards[bus_info].empty())
-			cards[bus_info] += std::string((char *)vcap.card)
+			cards[bus_info] += std::string(reinterpret_cast<char *>(vcap.card))
 				+ " (" + bus_info + "):\n";
 		cards[bus_info] += "\t" + (*iter);
 		cards[bus_info] += "\n";
@@ -375,7 +375,7 @@ static dev_vec list_devices(void)
 
 static int parse_subopt(char **subs, const char * const *subopts, char **value)
 {
-	int opt = getsubopt(subs, (char * const *)subopts, value);
+	int opt = getsubopt(subs, const_cast<char * const *>(subopts), value);
 
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
@@ -525,7 +525,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 
 	if (statistics->block_cnt)
 		block_error_percentage =
-			((float)statistics->block_error_cnt / statistics->block_cnt) * 100.0;
+			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0;
 	printf("block errors / group errors: %u (%3.2f%%) / %u \n",
 		statistics->block_error_cnt,
 		block_error_percentage, statistics->group_error_cnt);
@@ -534,7 +534,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 
 	if (statistics->block_cnt)
 		block_corrected_percentage = (
-			(float)statistics->block_corrected_cnt / statistics->block_cnt) * 100.0;
+			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0;
 	printf("corrected blocks: %u (%3.2f%%)\n",
 		statistics->block_corrected_cnt, block_corrected_percentage);
 	for (int i = 0; i < 16; i++)
@@ -766,7 +766,7 @@ static int parse_cl(int argc, char **argv)
 		if (opt == -1)
 			break;
 
-		params.options[(int)opt] = 1;
+		params.options[opt] = 1;
 		switch (opt) {
 		case OptSetDevice:
 			strncpy(params.fd_name, optarg, sizeof(params.fd_name) - 1);
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 3983a8a8..938c7c35 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -285,12 +285,12 @@ int check_string(const char *s, size_t len)
 
 int check_ustring(const __u8 *s, int len)
 {
-	return check_string((const char *)s, len);
+	return check_string(reinterpret_cast<const char *>(s), len);
 }
 
 int check_0(const void *p, int len)
 {
-	const __u8 *q = (const __u8 *)p;
+	const __u8 *q = static_cast<const __u8 *>(p);
 
 	while (len--)
 		if (*q++)
@@ -630,7 +630,7 @@ static int testCap(struct node *node)
 	    memcmp(vcap.bus_info, "rmi4:", 5))
 		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
 	if (!node->media_bus_info.empty() &&
-	    node->media_bus_info != std::string((const char *)vcap.bus_info))
+	    node->media_bus_info != std::string(reinterpret_cast<const char *>(vcap.bus_info)))
 		warn("media bus_info '%s' differs from V4L2 bus_info '%s'\n",
 		     node->media_bus_info.c_str(), vcap.bus_info);
 	fail_on_test((vcap.version >> 16) < 3);
@@ -808,7 +808,7 @@ static void streamingSetup(struct node *node)
 
 static int parse_subopt(char **subs, const char * const *subopts, char **value)
 {
-	int opt = getsubopt(subs, (char * const *)subopts, value);
+	int opt = getsubopt(subs, const_cast<char * const *>(subopts), value);
 
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
@@ -947,10 +947,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 	if (node.is_v4l2()) {
 		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
-		driver = (const char *)vcap.driver;
+		driver = reinterpret_cast<const char *>(vcap.driver);
 		is_vivid = driver == "vivid";
 		if (is_vivid)
-			node.bus_info = (const char *)vcap.bus_info;
+			node.bus_info = reinterpret_cast<const char *>(vcap.bus_info);
 		determine_codec_mask(node);
 	} else {
 		memset(&vcap, 0, sizeof(vcap));
@@ -1528,7 +1528,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		if (!option_index) {
 			for (i = 0; long_options[i].val; i++) {
 				if (long_options[i].val == ch) {
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index a103e463..3b45711d 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -161,7 +161,7 @@ static bool fill_output_buffer(const cv4l_queue &q, cv4l_buffer &buf, bool first
 		if (!stream_use_hdr) {
 			ssize_t sz = read(stream_from_fd, q.g_dataptr(buf.g_index(), p), len);
 
-			if (sz < (ssize_t)len) {
+			if (sz < static_cast<ssize_t>(len)) {
 				seek = true;
 				break;
 			}
@@ -183,7 +183,7 @@ static bool fill_output_buffer(const cv4l_queue &q, cv4l_buffer &buf, bool first
 
 		ssize_t sz = read(stream_from_fd, q.g_dataptr(buf.g_index(), p), bytesused);
 
-		if (sz < (ssize_t)bytesused) {
+		if (sz < static_cast<ssize_t>(bytesused)) {
 			seek = true;
 			break;
 		}
@@ -432,26 +432,26 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 				fail_on_test(g_field() == seq.last_field);
 				seq.field_nr ^= 1;
 				if (seq.field_nr) {
-					if ((int)g_sequence() != seq.last_seq)
+					if (static_cast<int>(g_sequence()) != seq.last_seq)
 						warn("got sequence number %u, expected %u\n",
 							g_sequence(), seq.last_seq);
 				} else {
 					fail_on_test((int)g_sequence() == seq.last_seq + 1);
-					if ((int)g_sequence() != seq.last_seq + 1)
+					if (static_cast<int>(g_sequence()) != seq.last_seq + 1)
 						warn("got sequence number %u, expected %u\n",
 							g_sequence(), seq.last_seq + 1);
 				}
 			} else {
 				fail_on_test(g_field() != fmt.g_field());
-				if ((int)g_sequence() != seq.last_seq + 1)
+				if (static_cast<int>(g_sequence()) != seq.last_seq + 1)
 					warn("got sequence number %u, expected %u\n",
 							g_sequence(), seq.last_seq + 1);
 			}
-		} else if ((int)g_sequence() != seq.last_seq + 1) {
+		} else if (static_cast<int>(g_sequence()) != seq.last_seq + 1) {
 			warn("got sequence number %u, expected %u\n",
 					g_sequence(), seq.last_seq + 1);
 		}
-		seq.last_seq = (int)g_sequence();
+		seq.last_seq = static_cast<int>(g_sequence());
 		seq.last_field = g_field();
 	} else {
 		fail_on_test(g_sequence());
@@ -985,7 +985,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 				       buf.g_index(), buf.g_sequence(),
 				       field2s(buf.g_field()).c_str(), buf.g_bytesused(),
 				       bufferflags2s(buf.g_flags()).c_str(),
-				       (__u64)buf.g_timestamp().tv_sec,  (__u64)buf.g_timestamp().tv_usec);
+				       static_cast<__u64>(buf.g_timestamp().tv_sec),  static_cast<__u64>(buf.g_timestamp().tv_usec));
 			for (unsigned p = 0; p < buf.g_num_planes(); p++) {
 				if (max_bytesused[p] < buf.g_bytesused(p))
 					max_bytesused[p] = buf.g_bytesused(p);
@@ -1072,7 +1072,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 			       buf.g_index(), buf.g_sequence(),
 			       field2s(buf.g_field()).c_str(), buf.g_bytesused(),
 			       bufferflags2s(buf.g_flags()).c_str(),
-			       (__u64)buf.g_timestamp().tv_sec, (__u64)buf.g_timestamp().tv_usec);
+			       static_cast<__u64>(buf.g_timestamp().tv_sec), static_cast<__u64>(buf.g_timestamp().tv_usec));
 		fail_on_test(ret);
 		if (v4l_type_is_capture(buf.g_type()) && buf.g_bytesused())
 			fail_on_test(buf.check(m2m_q, last_m2m_seq, true));
@@ -1607,7 +1607,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 			for (unsigned p = 0; p < q.g_num_planes(); p++) {
 				/* ensure that len is a multiple of 4 */
 				__u32 len = ((q.g_length(p) + 3) & ~0x3) + 4 * 4096;
-				__u32 *m = (__u32 *)malloc(len);
+				__u32 *m = static_cast<__u32 *>(malloc(len));
 
 				fail_on_test(!m);
 				fail_on_test((uintptr_t)m & 0x7);
@@ -1666,7 +1666,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 				__u32 buflen = (q.g_length(p) + 3U) & ~3U;
 				__u32 memlen = buflen + 4 * 4096;
 				__u32 *m = buffers[i][p];
-				__u32 *u = (__u32 *)q.g_userptr(i, p);
+				__u32 *u = static_cast<__u32 *>(q.g_userptr(i, p));
 
 				for (__u32 *x = m; x < u; x++)
 					if (*x != filler)
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index de4dd184..887b198b 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -505,7 +505,7 @@ static int testColorsFmt(struct node *node, unsigned component,
 		}
 		fail_on_test(skip);
 		for (unsigned i = 0; i < fmt.g_num_planes(); i++)
-			planes[i] = (__u8 *)q.g_dataptr(buf.g_index(), i);
+			planes[i] = static_cast<__u8 *>(q.g_dataptr(buf.g_index(), i));
 
 	} else {
 		fail_on_test(!(node->g_caps() & V4L2_CAP_READWRITE));
@@ -519,7 +519,7 @@ static int testColorsFmt(struct node *node, unsigned component,
 			ret = node->read(tmp, size);
 			fail_on_test(ret != size);
 		}
-		planes[0] = (__u8 *)tmp;
+		planes[0] = static_cast<__u8 *>(tmp);
 	}
 
 	setupPlanes(fmt, planes);
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 2a3f64e8..8c4480be 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -82,7 +82,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 			return fail("step == 0\n");
 		if (qctrl.step < 0)
 			return fail("step < 0\n");
-		if ((unsigned)qctrl.step > (unsigned)(qctrl.maximum - qctrl.minimum) &&
+		if (static_cast<unsigned>(qctrl.step) > static_cast<unsigned>(qctrl.maximum - qctrl.minimum) &&
 		    qctrl.maximum != qctrl.minimum)
 			return fail("step > max - min\n");
 		if ((qctrl.maximum - qctrl.minimum) % qctrl.step) {
@@ -162,7 +162,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 			continue;
 		if (i < qctrl.minimum || i > qctrl.maximum)
 			return fail("can get menu for out-of-range index\n");
-		if (qmenu.index != (__u32)i || qmenu.id != qctrl.id)
+		if (qmenu.index != static_cast<__u32>(i) || qmenu.id != qctrl.id)
 			return fail("id or index changed\n");
 		if (qctrl.type == V4L2_CTRL_TYPE_MENU &&
 		    check_ustring(qmenu.name, sizeof(qmenu.name)))
@@ -369,7 +369,7 @@ static int checkSimpleCtrl(struct v4l2_control &ctrl, struct test_query_ext_ctrl
 		}
 		break;
 	case V4L2_CTRL_TYPE_BITMASK:
-		if ((__u32)ctrl.value & ~qctrl.maximum)
+		if (static_cast<__u32>(ctrl.value) & ~qctrl.maximum)
 			return fail("returned control value out of range\n");
 		break;
 	case V4L2_CTRL_TYPE_BUTTON:
@@ -556,7 +556,7 @@ static int checkExtendedCtrl(struct v4l2_ext_control &ctrl, struct test_query_ex
 		}
 		break;
 	case V4L2_CTRL_TYPE_BITMASK:
-		if ((__u32)ctrl.value & ~qctrl.maximum)
+		if (static_cast<__u32>(ctrl.value) & ~qctrl.maximum)
 			return fail("returned control value out of range\n");
 		break;
 	case V4L2_CTRL_TYPE_BUTTON:
@@ -932,9 +932,9 @@ int testJpegComp(struct node *node)
 		if (ret)
 			return fail("VIDIOC_G_JPEGCOMP gave an error\n");
 		have_jpegcomp = true;
-		if (jc.COM_len < 0 || jc.COM_len > (int)sizeof(jc.COM_data))
+		if (jc.COM_len < 0 || jc.COM_len > static_cast<int>(sizeof(jc.COM_data)))
 			return fail("invalid COM_len value\n");
-		if (jc.APP_len < 0 || jc.APP_len > (int)sizeof(jc.APP_data))
+		if (jc.APP_len < 0 || jc.APP_len > static_cast<int>(sizeof(jc.APP_data)))
 			return fail("invalid APP_len value\n");
 		if (jc.quality < 0 || jc.quality > 100)
 			warn("weird quality value: %d\n", jc.quality);
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 9bc109db..3fc87316 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -174,7 +174,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
 				return ret;
 			if (ret == 0 && !(node->g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_CAPTURE_MPLANE)))
 				return fail("found discrete framesizes when no video capture is supported\n");
-			cookie = ((__u64)pixfmt << 32) |
+			cookie = (static_cast<__u64>(pixfmt) << 32) |
 				 (frmsize.discrete.width << 16) |
 				 frmsize.discrete.height;
 			node->frmsizes.insert(cookie);
@@ -1727,7 +1727,7 @@ static int testBasicScaling(struct node *node, const struct v4l2_format &cur)
 		compose_is_crop = compose_w == crop_w &&
 				  compose_h == crop_h;
 
-	cookie = ((__u64)v4l_format_g_pixelformat(&fmt) << 32) |
+	cookie = (static_cast<__u64>(v4l_format_g_pixelformat(&fmt)) << 32) |
 		  (v4l_format_g_width(&fmt) << 16) |
 		  v4l_format_g_height(&fmt);
 	if (node->can_output) {
@@ -1767,7 +1767,7 @@ static int testBasicScaling(struct node *node, const struct v4l2_format &cur)
 	if (compose_is_crop)
 		compose_is_crop = sel_compose.r.width == sel_crop.r.width &&
 				  sel_compose.r.height == sel_crop.r.height;
-	cookie = ((__u64)v4l_format_g_pixelformat(&fmt) << 32) |
+	cookie = (static_cast<__u64>(v4l_format_g_pixelformat(&fmt)) << 32) |
 		  (v4l_format_g_width(&fmt) << 16) |
 		  v4l_format_g_height(&fmt);
 	if (node->can_output) {
diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index 2bf338e6..fb8d12b1 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -233,7 +233,7 @@ int testTunerFreq(struct node *node)
 		ret = doioctl(node, VIDIOC_G_TUNER, &tuner);
 		if (ret)
 			return fail("could not get tuner %d\n", t);
-		last_type = (enum v4l2_tuner_type)tuner.type;
+		last_type = static_cast<enum v4l2_tuner_type>(tuner.type);
 		memset(&freq, 0, sizeof(freq));
 		freq.tuner = t;
 		ret = doioctl(node, VIDIOC_G_FREQUENCY, &freq);
@@ -259,7 +259,7 @@ int testTunerFreq(struct node *node)
 			warn("returned tuner %d frequency out of range (%d not in [%d...%d])\n",
 					t, freq.frequency, tuner.rangelow, tuner.rangehigh);
 
-		freq.type = (enum v4l2_tuner_type)0;
+		freq.type = static_cast<enum v4l2_tuner_type>(0);
 		ret = doioctl(node, VIDIOC_S_FREQUENCY, &freq);
 		if (ret != EINVAL)
 			return fail("did not return EINVAL when passed tuner type 0\n");
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index 6ac71400..bcd8a725 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -256,7 +256,7 @@ int testMediaTopology(struct node *node)
 			fail_on_test(pad.index == ~0U);
 			fail_on_test(v2_entity_pad_idx_set.find((__u64)pad.entity_id << 32 | pad.index) !=
 				     v2_entity_pad_idx_set.end());
-			v2_entity_pad_idx_set.insert((__u64)pad.entity_id << 32 | pad.index);
+			v2_entity_pad_idx_set.insert(static_cast<__u64>(pad.entity_id) << 32 | pad.index);
 		} else {
 			fail_on_test(pad.index);
 		}
@@ -429,7 +429,7 @@ int testMediaEnum(struct node *node)
 				     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE));
 			if (node->topology &&
 			    MEDIA_V2_PAD_HAS_INDEX(node->media_version)) {
-				__u64 key = (__u64)ent.id << 32 | links.pads[i].index;
+				__u64 key = static_cast<__u64>(ent.id) << 32 | links.pads[i].index;
 
 				fail_on_test(v2_entity_pad_idx_set.find(key) ==
 					     v2_entity_pad_idx_set.end());
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index ce6ac2fd..f2997951 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -314,8 +314,8 @@ static void list_devices()
 					card = mdi.driver;
 			}
 		} else {
-			bus_info = (const char *)vcap.bus_info;
-			card = (const char *)vcap.card;
+			bus_info = reinterpret_cast<const char *>(vcap.bus_info);
+			card = reinterpret_cast<const char *>(vcap.card);
 		}
 		close(fd);
 		if (err)
@@ -385,7 +385,7 @@ static std::string safename(const unsigned char *name)
 
 static std::string safename(const char *name)
 {
-	return safename((const unsigned char *)name);
+	return safename(reinterpret_cast<const unsigned char *>(name));
 }
 
 static void print_qctrl(int fd, struct v4l2_query_ext_ctrl *queryctrl,
@@ -543,7 +543,7 @@ static int print_control(int fd, struct v4l2_query_ext_ctrl &qctrl, int show_men
 	     qctrl.id < V4L2_CID_PRIVATE_BASE)) {
 		if (qctrl.type == V4L2_CTRL_TYPE_STRING) {
 		    ext_ctrl.size = qctrl.maximum + 1;
-		    ext_ctrl.string = (char *)malloc(ext_ctrl.size);
+		    ext_ctrl.string = static_cast<char *>(malloc(ext_ctrl.size));
 		    ext_ctrl.string[0] = 0;
 		}
 		if (test_ioctl(fd, VIDIOC_G_EXT_CTRLS, &ctrls)) {
@@ -584,8 +584,8 @@ static int query_ext_ctrl_ioctl(int fd, struct v4l2_query_ext_ctrl &qctrl)
 		memcpy(qctrl.name, qc.name, sizeof(qctrl.name));
 		qctrl.minimum = qc.minimum;
 		if (qc.type == V4L2_CTRL_TYPE_BITMASK) {
-			qctrl.maximum = (__u32)qc.maximum;
-			qctrl.default_value = (__u32)qc.default_value;
+			qctrl.maximum = static_cast<__u32>(qc.maximum);
+			qctrl.default_value = static_cast<__u32>(qc.default_value);
 		} else {
 			qctrl.maximum = qc.maximum;
 			qctrl.default_value = qc.default_value;
@@ -840,7 +840,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 		}
 		break;
 	case OptSetPriority:
-		prio = (enum v4l2_priority)strtoul(optarg, 0L, 0);
+		prio = static_cast<enum v4l2_priority>(strtoul(optarg, 0L, 0));
 		break;
 	case OptListDevices:
 		if (media_bus_info.empty())
@@ -1064,7 +1064,7 @@ static void print_array(const struct v4l2_query_ext_ctrl &qc, void *p)
 		switch (qc.type) {
 		case V4L2_CTRL_TYPE_U8:
 			for (i = from; i <= to; i++) {
-				printf("%4d", ((__u8 *)p)[idx + i]);
+				printf("%4d", (static_cast<__u8 *>(p))[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -1072,7 +1072,7 @@ static void print_array(const struct v4l2_query_ext_ctrl &qc, void *p)
 			break;
 		case V4L2_CTRL_TYPE_U16:
 			for (i = from; i <= to; i++) {
-				printf("%6d", ((__u16 *)p)[idx + i]);
+				printf("%6d", (static_cast<__u16 *>(p))[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -1080,7 +1080,7 @@ static void print_array(const struct v4l2_query_ext_ctrl &qc, void *p)
 			break;
 		case V4L2_CTRL_TYPE_U32:
 			for (i = from; i <= to; i++) {
-				printf("%6d", ((__u32 *)p)[idx + i]);
+				printf("%6d", (static_cast<__u32 *>(p))[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 319cbb4b..366e6522 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -235,7 +235,7 @@ static void edid_add_block(struct v4l2_edid *e)
 		e->edid = NULL;
 		exit(1);
 	}
-	e->edid = (unsigned char *)realloc(e->edid, e->blocks * 128);
+	e->edid = static_cast<unsigned char *>(realloc(e->edid, e->blocks * 128));
 }
 
 static void read_edid_file(FILE *f, struct v4l2_edid *e)
@@ -1332,7 +1332,7 @@ void edid_get(cv4l_fd &_fd)
 				exit(1);
 			}
 		}
-		gedid.edid = (unsigned char *)malloc(gedid.blocks * 128);
+		gedid.edid = static_cast<unsigned char *>(malloc(gedid.blocks * 128));
 		if (doioctl(fd, VIDIOC_G_EDID, &gedid) == 0) {
 			if (options[OptFixEdidChecksums])
 				fix_edid(&gedid);
@@ -1344,7 +1344,7 @@ void edid_get(cv4l_fd &_fd)
 	}
 	if (options[OptInfoEdid]) {
 		info_edid.blocks = 2;
-		info_edid.edid = (unsigned char *)malloc(info_edid.blocks * 128);
+		info_edid.edid = static_cast<unsigned char *>(malloc(info_edid.blocks * 128));
 		if (doioctl(fd, VIDIOC_G_EDID, &info_edid) == 0)
 			print_edid_mods(&info_edid);
 		free(info_edid.edid);
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index dc2756c8..1130fdc0 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -184,7 +184,7 @@ void io_list(cv4l_fd &_fd)
 			printf("\tType        : 0x%08X (%s)\n", vin.type, inputtype2s(vin.type));
 			printf("\tAudioset    : 0x%08X\n", vin.audioset);
 			printf("\tTuner       : 0x%08X\n", vin.tuner);
-			printf("\tStandard    : 0x%016llX (%s)\n", (unsigned long long)vin.std,
+			printf("\tStandard    : 0x%016llX (%s)\n", static_cast<unsigned long long>(vin.std),
 				std2s(vin.std).c_str());
 			printf("\tStatus      : 0x%08X (%s)\n", vin.status, in_status2s(vin.status).c_str());
 			printf("\tCapabilities: 0x%08X (%s)\n", vin.capabilities, input_cap2s(vin.capabilities).c_str());
@@ -204,7 +204,7 @@ void io_list(cv4l_fd &_fd)
 			printf("\tName        : %s\n", vout.name);
 			printf("\tType        : 0x%08X (%s)\n", vout.type, outputtype2s(vout.type));
 			printf("\tAudioset    : 0x%08X\n", vout.audioset);
-			printf("\tStandard    : 0x%016llX (%s)\n", (unsigned long long)vout.std,
+			printf("\tStandard    : 0x%016llX (%s)\n", static_cast<unsigned long long>(vout.std),
 					std2s(vout.std).c_str());
 			printf("\tCapabilities: 0x%08X (%s)\n", vout.capabilities, output_cap2s(vout.capabilities).c_str());
 			vout.index++;
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index b1288297..0e1071b0 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -155,10 +155,10 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 	switch (fmt.g_pixelformat()) {
 	case V4L2_META_FMT_UVC:
 		fprintf(f, "UVC: ");
-		vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), 0);
+		vbuf = static_cast<vivid_uvc_meta_buf *>(q.g_dataptr(buf.g_index(), 0));
 
 		fprintf(f, "%.6fs sof: %4d len: %u flags: 0x%02x",
-			(double)vbuf->ns / 1000000000.0,
+			static_cast<double>(vbuf->ns) / 1000000000.0,
 			vbuf->sof,
 			vbuf->length,
 			vbuf->flags);
@@ -174,7 +174,7 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 		break;
 	case V4L2_META_FMT_VIVID:
 		fprintf(f, "VIVID:");
-		vbuf_out = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
+		vbuf_out = static_cast<vivid_meta_out_buf *>(q.g_dataptr(buf.g_index(), 0));
 
 		fprintf(f, " brightness: %u contrast: %u saturation: %u  hue: %d\n",
 			vbuf_out->brightness, vbuf_out->contrast,
@@ -189,7 +189,7 @@ void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 
 	switch (fmt.g_pixelformat()) {
 		case V4L2_META_FMT_VIVID:
-			vbuf = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
+			vbuf = static_cast<vivid_meta_out_buf *>(q.g_dataptr(buf.g_index(), 0));
 			vbuf->brightness = buf.g_sequence() % 192 + 64;
 			vbuf->contrast = (buf.g_sequence() + 10) % 192 + 64;
 			vbuf->saturation = (buf.g_sequence() + 20) % 256;
diff --git a/utils/v4l2-ctl/v4l2-ctl-modes.cpp b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
index 9db07f1a..b311ce5d 100644
--- a/utils/v4l2-ctl/v4l2-ctl-modes.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-modes.cpp
@@ -224,7 +224,7 @@ bool calc_cvt_modeline(int image_width, int image_height,
 		if (ideal_blank_duty_cycle < 20 * HV_FACTOR)
 			ideal_blank_duty_cycle = 20 * HV_FACTOR;
 
-		h_blank = active_h_pixel * (long long)ideal_blank_duty_cycle /
+		h_blank = active_h_pixel * static_cast<long long>(ideal_blank_duty_cycle) /
 			 (100 * HV_FACTOR - ideal_blank_duty_cycle);
 		h_blank -= h_blank % (2 * CVT_CELL_GRAN);
 
@@ -238,7 +238,7 @@ bool calc_cvt_modeline(int image_width, int image_height,
 		h_bp = h_blank / 2;
 		h_fp = h_blank - h_bp - h_sync;
 
-		pixel_clock =  ((long long)total_h_pixel * HV_FACTOR * 1000000)
+		pixel_clock =  (static_cast<long long>(total_h_pixel) * HV_FACTOR * 1000000)
 				/ h_period;
 		pixel_clock -= pixel_clock  % clk_gran;
 	} else {
@@ -468,10 +468,10 @@ bool calc_gtf_modeline(int image_width, int image_height,
 	v_blank = v_sync + v_bp + v_fp;
 	total_v_lines = active_v_lines + v_blank;
 
-	v_refresh_est = (2 * HV_FACTOR * (long long)1000000) /
+	v_refresh_est = (2 * HV_FACTOR * static_cast<long long>(1000000)) /
 			(h_period_est * (2 * total_v_lines + interlace) / HV_FACTOR);
 
-	h_period = ((long long)h_period_est * v_refresh_est) /
+	h_period = (static_cast<long long>(h_period_est) * v_refresh_est) /
 		   (v_refresh * HV_FACTOR);
 
 	if (!reduced_blanking)
@@ -481,7 +481,7 @@ bool calc_gtf_modeline(int image_width, int image_height,
 		ideal_blank_duty_cycle = (GTF_S_C_PRIME * HV_FACTOR) -
 				      GTF_S_M_PRIME * h_period / 1000;
 
-	h_blank = active_h_pixel * (long long)ideal_blank_duty_cycle /
+	h_blank = active_h_pixel * static_cast<long long>(ideal_blank_duty_cycle) /
 			 (100 * HV_FACTOR - ideal_blank_duty_cycle);
 	h_blank = ((h_blank + GTF_CELL_GRAN) / (2 * GTF_CELL_GRAN))
 			  * (2 * GTF_CELL_GRAN);
@@ -493,7 +493,7 @@ bool calc_gtf_modeline(int image_width, int image_height,
 	h_fp = h_blank / 2 - h_sync;
 	h_bp = h_fp + h_sync;
 
-	pixel_clock = ((long long)total_h_pixel * HV_FACTOR * 1000000)
+	pixel_clock = (static_cast<long long>(total_h_pixel) * HV_FACTOR * 1000000)
 					/ h_period;
 	/* Not sure if clock value needs to be truncated to multiple
 	 * of 25000. The formula given in standard does not indicate
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 162248bc..4c9609d6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -402,12 +402,12 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 
 	win.bitmap = NULL;
 	if (keep_old_bitmap) {
-		bitmap = (unsigned char *)calloc(1, stride * win.w.height);
+		bitmap = static_cast<unsigned char *>(calloc(1, stride * win.w.height));
 		win.bitmap = bitmap;
 	}
 	if (keep_old_clip) {
 		if (win.clipcount)
-			cliplist = (struct v4l2_clip *)malloc(win.clipcount * sizeof(*cliplist));
+			cliplist = static_cast<struct v4l2_clip *>(malloc(win.clipcount * sizeof(*cliplist)));
 		win.clips = cliplist;
 	}
 	if (keep_old_clip || keep_old_bitmap)
@@ -435,7 +435,7 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 	if (!bitmap_rects.empty()) {
 		free(bitmap);
 		stride = (win.w.width + 7) / 8;
-		bitmap = (unsigned char *)calloc(1, stride * win.w.height);
+		bitmap = static_cast<unsigned char *>(calloc(1, stride * win.w.height));
 		win.bitmap = bitmap;
 		for (unsigned i = 0; i < bitmap_rects.size(); i++) {
 			const v4l2_rect &r = bitmap_rects[i];
@@ -518,8 +518,8 @@ void overlay_get(cv4l_fd &_fd)
 			unsigned stride = (fmt.fmt.win.w.width + 7) / 8;
 
 			if (fmt.fmt.win.clipcount)
-				fmt.fmt.win.clips = (struct v4l2_clip *)malloc(fmt.fmt.win.clipcount * sizeof(clips[0]));
-			bitmap = (unsigned char *)calloc(1, stride * fmt.fmt.win.w.height);
+				fmt.fmt.win.clips = static_cast<struct v4l2_clip *>(malloc(fmt.fmt.win.clipcount * sizeof(clips[0])));
+			bitmap = static_cast<unsigned char *>(calloc(1, stride * fmt.fmt.win.w.height));
 			fmt.fmt.win.bitmap = bitmap;
 			doioctl(fd, VIDIOC_G_FMT, &fmt);
 			printfmt(fd, fmt);
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index d2cbae74..7ba44ae3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -379,7 +379,7 @@ static void print_dv_timings(const struct v4l2_dv_timings *t)
 		if (options[OptConcise]) {
 			printf("\t%dx%d%c%.2f %s\n", bt->width, bt->height,
 				bt->interlaced ? 'i' : 'p',
-				(double)bt->pixelclock /
+				static_cast<double>(bt->pixelclock) /
 					(tot_width * (tot_height / (bt->interlaced ? 2 : 1))),
 				dvflags2s(bt->vsync, bt->flags).c_str());
 			break;
@@ -399,10 +399,10 @@ static void print_dv_timings(const struct v4l2_dv_timings *t)
 		printf("\tPixelclock: %lld Hz", bt->pixelclock);
 		if (bt->width && bt->height) {
 			if (bt->interlaced)
-				printf(" (%.2f fields per second)", (double)bt->pixelclock /
+				printf(" (%.2f fields per second)", static_cast<double>(bt->pixelclock) /
 					(tot_width * (tot_height / 2)));
 			else
-				printf(" (%.2f frames per second)", (double)bt->pixelclock /
+				printf(" (%.2f frames per second)", static_cast<double>(bt->pixelclock) /
 					(tot_width * tot_height));
 		}
 		printf("\n");
@@ -495,7 +495,7 @@ void stds_set(cv4l_fd &_fd)
 			}
 		}
 		if (doioctl(fd, VIDIOC_S_STD, &standard) == 0)
-			printf("Standard set to %08llx\n", (unsigned long long)standard);
+			printf("Standard set to %08llx\n", static_cast<unsigned long long>(standard));
 	}
 
 	if (options[OptSetDvBtTimings]) {
@@ -585,7 +585,7 @@ void stds_get(cv4l_fd &_fd)
 
 	if (options[OptGetStandard]) {
 		if (doioctl(fd, VIDIOC_G_STD, &standard) == 0) {
-			printf("Video Standard = 0x%08llx\n", (unsigned long long)standard);
+			printf("Video Standard = 0x%08llx\n", static_cast<unsigned long long>(standard));
 			printf("\t%s\n", std2s(standard, "\n\t").c_str());
 		}
 	}
@@ -624,7 +624,7 @@ void stds_get(cv4l_fd &_fd)
 
         if (options[OptQueryStandard]) {
 		if (doioctl(fd, VIDIOC_QUERYSTD, &standard) == 0) {
-			printf("Video Standard = 0x%08llx\n", (unsigned long long)standard);
+			printf("Video Standard = 0x%08llx\n", static_cast<unsigned long long>(standard));
 			printf("\t%s\n", std2s(standard, "\n\t").c_str());
 		}
 	}
@@ -647,12 +647,12 @@ void stds_list(cv4l_fd &_fd)
 		while (test_ioctl(fd, VIDIOC_ENUMSTD, &vs) >= 0) {
 			if (options[OptConcise]) {
 				printf("\t%2d: 0x%016llX %s\n", vs.index,
-						(unsigned long long)vs.id, vs.name);
+						static_cast<unsigned long long>(vs.id), vs.name);
 			} else {
 				if (vs.index)
 					printf("\n");
 				printf("\tIndex       : %d\n", vs.index);
-				printf("\tID          : 0x%016llX\n", (unsigned long long)vs.id);
+				printf("\tID          : 0x%016llX\n", static_cast<unsigned long long>(vs.id));
 				printf("\tName        : %s\n", vs.name);
 				printf("\tFrame period: %d/%d\n",
 						vs.frameperiod.numerator,
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index d9a307f9..de40c5ad 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -253,7 +253,7 @@ double fps_timestamps::fps()
 	double period = sum / cnt;
 	double fps = 1.0 / period;
 
-	first += (unsigned)(ts[prev_idx] - first);
+	first += static_cast<unsigned>(ts[prev_idx] - first);
 	return fps;
 };
 
@@ -510,7 +510,7 @@ static void print_buffer(FILE *f, struct v4l2_buffer &buf)
 	fprintf(f, "\tLength   : %u\n", buf.length);
 	fprintf(f, "\tBytesused: %u\n", buf.bytesused);
 	fprintf(f, "\tTimestamp: %llu.%06llus (%s, %s)\n",
-		(__u64)buf.timestamp.tv_sec, (__u64)buf.timestamp.tv_usec,
+		static_cast<__u64>(buf.timestamp.tv_sec), static_cast<__u64>(buf.timestamp.tv_usec),
 		timestamp_type2s(buf.flags).c_str(), timestamp_src2s(buf.flags).c_str());
 	if (buf.flags & V4L2_BUF_FLAG_TIMECODE) {
 		static const int fps_types[] = { 0, 24, 25, 30, 50, 60 };
@@ -721,9 +721,9 @@ void streaming_cmd(int ch, char *optarg)
 		if (speed > 3)
 			speed = 3;
 		if (ch == OptStreamOutHorSpeed)
-			stream_out_hor_mode = (tpg_move_mode)(speed + 3);
+			stream_out_hor_mode = static_cast<tpg_move_mode>(speed + 3);
 		else
-			stream_out_vert_mode = (tpg_move_mode)(speed + 3);
+			stream_out_vert_mode = static_cast<tpg_move_mode>(speed + 3);
 		break;
 	case OptStreamOutPercFill:
 		stream_out_perc_fill = strtoul(optarg, 0L, 0);
@@ -1023,7 +1023,7 @@ static bool fill_buffer_from_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &b,
 		read_u32(fin);  // ignore field
 		read_u32(fin);  // ignore flags
 		for (unsigned j = 0; j < q.g_num_planes(); j++) {
-			__u8 *buf = (__u8 *)q.g_dataptr(b.g_index(), j);
+			__u8 *buf = static_cast<__u8 *>(q.g_dataptr(b.g_index(), j));
 
 			sz = read_u32(fin);
 			if (sz != V4L_STREAM_PACKET_FRAME_VIDEO_SIZE_PLANE_HDR) {
@@ -1052,7 +1052,7 @@ static bool fill_buffer_from_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &b,
 					fprintf(stderr, "error reading %d bytes\n", sz);
 					return false;
 				}
-				if ((__u32)n == sz)
+				if (static_cast<__u32>(n) == sz)
 					break;
 				offset += n;
 				sz -= n;
@@ -1108,10 +1108,10 @@ restart:
 		}
 
 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS)
-			res = read_fwht_frame(fmt, (unsigned char *)buf, fin,
+			res = read_fwht_frame(fmt, static_cast<unsigned char *>(buf), fin,
 					      sz, expected_len, buf_len);
 		else if (support_out_crop && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
-			res = read_write_padded_frame(fmt, (unsigned char *)buf,
+			res = read_write_padded_frame(fmt, static_cast<unsigned char *>(buf),
 						      fin, sz, expected_len, buf_len, true);
 		else
 			sz = fread(buf, 1, expected_len, fin);
@@ -1197,7 +1197,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 		for (p = 0; p < fmt.g_num_planes(); p++)
 			tpg_s_bytesperline(&tpg, p,
 					   fmt.g_bytesperline(p));
-		tpg_s_pattern(&tpg, (tpg_pattern)stream_pat);
+		tpg_s_pattern(&tpg, static_cast<tpg_pattern>(stream_pat));
 		tpg_s_mv_hor_mode(&tpg, stream_out_hor_mode);
 		tpg_s_mv_vert_mode(&tpg, stream_out_vert_mode);
 		tpg_s_show_square(&tpg, stream_out_square);
@@ -1215,7 +1215,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			tpg_s_pixel_aspect(&tpg, aspect);
 			break;
 		default:
-			tpg_s_pixel_aspect(&tpg, (tpg_pixel_aspect)stream_out_pixel_aspect);
+			tpg_s_pixel_aspect(&tpg, static_cast<tpg_pixel_aspect>(stream_out_pixel_aspect));
 			break;
 		}
 		field = output_field;
@@ -1245,7 +1245,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 
 			if (can_fill) {
 				for (unsigned j = 0; j < q.g_num_planes(); j++)
-					tpg_fillbuffer(&tpg, stream_out_std, j, (u8 *)q.g_dataptr(i, j));
+					tpg_fillbuffer(&tpg, stream_out_std, j, static_cast<u8 *>(q.g_dataptr(i, j)));
 			}
 		}
 		if (is_meta)
@@ -1318,7 +1318,7 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 		for (unsigned j = 0; j < buf.g_num_planes(); j++) {
 			__u32 used = buf.g_bytesused(j);
 			unsigned offset = buf.g_data_offset(j);
-			u8 *p = (u8 *)q.g_dataptr(buf.g_index(), j) + offset;
+			u8 *p = static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset;
 
 			if (ctx) {
 				comp_ptr[j] = fwht_compress(ctx, p,
@@ -1365,10 +1365,10 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 		if (host_fd_to >= 0)
 			sz = fwrite(comp_ptr[j] + offset, 1, used, fout);
 		else if (support_cap_compose && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
-			read_write_padded_frame(fmt, (u8 *)q.g_dataptr(buf.g_index(), j) + offset,
+			read_write_padded_frame(fmt, static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset,
 						fout, sz, used, used, false);
 		else
-			sz = fwrite((u8 *)q.g_dataptr(buf.g_index(), j) + offset, 1, used, fout);
+			sz = fwrite(static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset, 1, used, fout);
 
 		if (sz != used)
 			fprintf(stderr, "%u != %u\n", sz, used);
@@ -1500,7 +1500,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 			unsigned data_offset = cap->g_data_offset(j);
 
 			if (q.g_memory() == V4L2_MEMORY_USERPTR) {
-				buf.s_userptr((u8 *)cap->g_userptr(j) + data_offset, j);
+				buf.s_userptr(static_cast<u8 *>(cap->g_userptr(j)) + data_offset, j);
 				buf.s_bytesused(cap->g_bytesused(j) - data_offset, j);
 				buf.s_data_offset(0, j);
 			} else if (q.g_memory() == V4L2_MEMORY_DMABUF) {
@@ -1551,7 +1551,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 	if (!fin && stream_out_refresh) {
 		for (unsigned j = 0; j < buf.g_num_planes(); j++)
 			tpg_fillbuffer(&tpg, stream_out_std, j,
-				       (u8 *)q.g_dataptr(buf.g_index(), j));
+				       static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)));
 	}
 	if (is_meta)
 		meta_fillbuffer(buf, fmt, q);
@@ -1683,13 +1683,13 @@ static FILE *open_output_file(cv4l_fd &fd)
 		fprintf(stderr, "no such host %s\n", host_to);
 		exit(0);
 	}
-	memset((char *)&serv_addr, 0, sizeof(serv_addr));
+	memset(reinterpret_cast<char *>(&serv_addr), 0, sizeof(serv_addr));
 	serv_addr.sin_family = AF_INET;
-	memcpy((char *)&serv_addr.sin_addr.s_addr,
-	       (char *)server->h_addr,
+	memcpy(reinterpret_cast<char *>(&serv_addr.sin_addr.s_addr),
+	       server->h_addr,
 	       server->h_length);
 	serv_addr.sin_port = htons(host_port_to);
-	if (connect(host_fd_to, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
+	if (connect(host_fd_to, reinterpret_cast<struct sockaddr *>(&serv_addr), sizeof(serv_addr)) < 0) {
 		fprintf(stderr, "could not connect\n");
 		exit(0);
 	}
@@ -1941,13 +1941,13 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	serv_addr.sin_family = AF_INET;
 	serv_addr.sin_addr.s_addr = INADDR_ANY;
 	serv_addr.sin_port = htons(host_port_from);
-	if (bind(listen_fd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
+	if (bind(listen_fd, reinterpret_cast<struct sockaddr *>(&serv_addr), sizeof(serv_addr)) < 0) {
 		fprintf(stderr, "could not bind\n");
 		exit(1);
 	}
 	listen(listen_fd, 1);
 	clilen = sizeof(cli_addr);
-	host_fd_from = accept(listen_fd, (struct sockaddr *)&cli_addr, &clilen);
+	host_fd_from = accept(listen_fd, reinterpret_cast<struct sockaddr *>(&cli_addr), &clilen);
 	if (host_fd_from < 0) {
 		fprintf(stderr, "could not accept\n");
 		exit(1);
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 8f87ecbd..a9ef8eed 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -365,7 +365,7 @@ void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 		'.', ',', ':', ';', '!', '|', 'i', 'c',
 		'n', 'o', 'm', 'I', 'C', 'N', 'O', 'M',
 	};
-	__s16 *vbuf = (__s16 *)q.g_dataptr(buf.g_index(), 0);
+	__s16 *vbuf = static_cast<__s16 *>(q.g_dataptr(buf.g_index(), 0));
 	__u32 x, y;
 
 	switch (fmt.g_pixelformat()) {
@@ -374,7 +374,7 @@ void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 			fprintf(f, "TD16: ");
 
 			for (x = 0; x < fmt.g_width(); x++, vbuf++) {
-				__s16 v = (__s16)le16toh(*vbuf);
+				__s16 v = static_cast<__s16>(le16toh(*vbuf));
 
 				if (!options[OptConcise])
 					fprintf(f, "% 4d", v);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 1866172f..42889ef8 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -396,7 +396,7 @@ static std::string printfmtname(int fd, __u32 type, __u32 pixfmt)
 	fmt.type = type;
 	while (test_ioctl(fd, VIDIOC_ENUM_FMT, &fmt) >= 0) {
 		if (fmt.pixelformat == pixfmt)
-			return s + (const char *)fmt.description + ")";
+			return s + reinterpret_cast<const char *>(fmt.description) + ")";
 		fmt.index++;
 	}
 	return "";
@@ -476,7 +476,7 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 			}
 		printf("\tClip Bitmap : %s", vfmt.fmt.win.bitmap ? "Yes, " : "No\n");
 		if (vfmt.fmt.win.bitmap) {
-			unsigned char *bitmap = (unsigned char *)vfmt.fmt.win.bitmap;
+			unsigned char *bitmap = static_cast<unsigned char *>(vfmt.fmt.win.bitmap);
 			unsigned stride = (vfmt.fmt.win.w.width + 7) / 8;
 			unsigned cnt = 0;
 
@@ -493,7 +493,7 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 		printf("\tSampling Rate   : %u Hz\n", vfmt.fmt.vbi.sampling_rate);
 		printf("\tOffset          : %u samples (%g secs after leading edge)\n",
 				vfmt.fmt.vbi.offset,
-				(double)vfmt.fmt.vbi.offset / (double)vfmt.fmt.vbi.sampling_rate);
+				static_cast<double>(vfmt.fmt.vbi.offset) / static_cast<double>(vfmt.fmt.vbi.sampling_rate));
 		printf("\tSamples per Line: %u\n", vfmt.fmt.vbi.samples_per_line);
 		printf("\tSample Format   : '%s'\n", fcc2s(vfmt.fmt.vbi.sample_format).c_str());
 		printf("\tStart 1st Field : %u\n", vfmt.fmt.vbi.start[0]);
@@ -657,7 +657,7 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type)
 
 int parse_subopt(char **subs, const char * const *subopts, char **value)
 {
-	int opt = getsubopt(subs, (char * const *)subopts, value);
+	int opt = getsubopt(subs, const_cast<char * const *>(subopts), value);
 
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
@@ -886,7 +886,7 @@ int parse_selection_target(const char *s, unsigned int &target)
 static void print_event(const struct v4l2_event *ev)
 {
 	printf("%lld.%06ld: event %u, pending %u: ",
-			(__u64)ev->timestamp.tv_sec, ev->timestamp.tv_nsec / 1000,
+			static_cast<__u64>(ev->timestamp.tv_sec), ev->timestamp.tv_nsec / 1000,
 			ev->sequence, ev->pending);
 	switch (ev->type) {
 	case V4L2_EVENT_VSYNC:
@@ -1154,7 +1154,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		if (!option_index) {
 			for (i = 0; long_options[i].val; i++) {
 				if (long_options[i].val == ch) {
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 8fb70775..17ab0210 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -382,7 +382,7 @@ static int doioctl(int fd, unsigned long int request, void *parm, const char *na
 
 static int parse_subopt(char **subs, const char * const *subopts, char **value)
 {
-	int opt = getsubopt(subs, (char * const *)subopts, value);
+	int opt = getsubopt(subs, const_cast<char * const *>(subopts), value);
 
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
@@ -451,7 +451,7 @@ int main(int argc, char **argv)
 		if (ch == -1)
 			break;
 
-		options[(int)ch] = 1;
+		options[ch] = 1;
 		if (!option_index) {
 			for (i = 0; long_options[i].val; i++) {
 				if (long_options[i].val == ch) {
-- 
2.25.2

