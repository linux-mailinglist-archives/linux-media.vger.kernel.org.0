Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81F11BD368
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgD2EGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725497AbgD2EGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:34 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8501C03C1AC
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:32 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f8so368663plt.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sXOiGl4Q6PEpSoPUX4WqQfgJF+uMe3eyWU1D2owBpLQ=;
        b=Xs/OXuL7ay66py4qX0/++HrnbvIKOW/cT5lNh08do/3zsKCmOHpLk4N3XJb6Z3V1V9
         fOqa/cv9AjXVVbKjnAoYp2qEkai/3IhnvR40AdFCsLIKaIl+2v9GH522Fz1rhPYF8jTu
         S4/wZtYE/kZ20oM/8EiwTigCClPKwJ1shrS72j6vBCRziypTSdHPjsrmPGDppsTApH4A
         I94m2XobwChxaJZa5FZJ2ZoBY9aSM7ocOZN9hxafI6V8+8/EGJ82IRBjOfSwgh+hHjAu
         yZ5B38K3CNVLcGwKPKQcSDc7zCBDzaH2br4hRaoZVuf7n/LG233zOJjKrmt1d+iO28E3
         Z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXOiGl4Q6PEpSoPUX4WqQfgJF+uMe3eyWU1D2owBpLQ=;
        b=B0/Ix71aDVTHeNKIPxmlHCH5dr7KYydNL0S+0yD/2CnO6YCexj62+vS87fOFqp6MS2
         /Mx+qg4PF3t2OV0YwLdZjHk2UYXPWpJ6gRzd6VbEndsKg999VTho3F3tnNV3po53u0aP
         EGnvYYJf+1+WAWH6AqtfzELunIT247jNCNN4zzMdLNncvvLBKPAaNl1lb43dUyzsCeo0
         fTQ/URvHz3/9yzQKFghHtxUIIsNmuX5TctLAaXhNtQ7C3LL0MUNzDgqezSKTlQ0Ch0h2
         O7blr52L6O8z8vyCSLOFNfnyEulY0spClWhWCaos96MVfjmz+O+nFxfcCs1zxB4WFC/g
         WhUw==
X-Gm-Message-State: AGi0Pubp7zlzS54pLRDC47fUVVb9a77xh2dS5oOQRLmX2p8hV6zyPzB4
        tzJOUrKBUk+lcnnOVqDP6zOuH37LPdI=
X-Google-Smtp-Source: APiQypJlGqk3E8dZRf2faxCJ8B6J+HWlxm5U/WOMyEFJrhnc7AmC1jbv5vdbhkxl3lplgf0CA2dOpg==
X-Received: by 2002:a17:90a:fd89:: with SMTP id cx9mr828631pjb.64.1588133191527;
        Tue, 28 Apr 2020 21:06:31 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:31 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/7] utils: convert all is* functions to std
Date:   Tue, 28 Apr 2020 21:06:23 -0700
Message-Id: <20200429040627.27859-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  6 +++---
 utils/cec-compliance/cec-compliance.h     |  2 +-
 utils/cec-compliance/cec-test.cpp         |  2 +-
 utils/cec-ctl/cec-ctl.cpp                 |  4 ++--
 utils/cec-follower/cec-follower.cpp       |  2 +-
 utils/common/media-info.cpp               |  4 ++--
 utils/libcecutil/cec-info.cpp             |  2 +-
 utils/libcecutil/cec-parse.cpp            |  2 +-
 utils/rds-ctl/rds-ctl.cpp                 |  2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp |  4 ++--
 utils/v4l2-ctl/v4l2-ctl-common.cpp        |  6 +++---
 utils/v4l2-ctl/v4l2-ctl-edid.cpp          |  2 +-
 utils/v4l2-ctl/v4l2-ctl-stds.cpp          | 12 ++++++------
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp        |  4 ++--
 utils/v4l2-ctl/v4l2-ctl.cpp               |  8 ++++----
 utils/v4l2-dbg/v4l2-dbg.cpp               |  4 ++--
 16 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index d0580579..5f0a74ec 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -244,10 +244,10 @@ std::string safename(const char *name)
 	bool not_alnum = false;
 
 	while (*name) {
-		if (isalnum(*name)) {
+		if (std::isalnum(*name)) {
 			if (not_alnum && !s.empty())
 				s += '-';
-			s += tolower(*name);
+			s += std::tolower(*name);
 			not_alnum = false;
 		} else if (!not_alnum)
 			not_alnum = true;
@@ -1158,7 +1158,7 @@ int main(int argc, char **argv)
 	collectTests();
 
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument) {
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 36b83d26..b435782f 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -293,7 +293,7 @@ static inline char get_yn()
 {
 	char c;
 
-	while ((c = tolower(getchar())) != 'y' && c != 'n');
+	while ((c = std::tolower(getchar())) != 'y' && c != 'n');
 	getchar();
 	return c;
 }
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index a84f83d3..67d4c397 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1533,7 +1533,7 @@ int setExpectedResult(char *optarg, bool no_warnings)
 {
 	char *equal = std::strchr(optarg, '=');
 
-	if (!equal || equal == optarg || !isdigit(equal[1]))
+	if (!equal || equal == optarg || !std::isdigit(equal[1]))
 		return 1;
 	*equal = 0;
 	std::string name = safename(optarg);
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 899b83b1..8c4b2ffa 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1756,7 +1756,7 @@ static void list_devices()
 		return;
 	}
 	while ((ep = readdir(dp)))
-		if (!memcmp(ep->d_name, "cec", 3) && isdigit(ep->d_name[3]))
+		if (!memcmp(ep->d_name, "cec", 3) && std::isdigit(ep->d_name[3]))
 			files.push_back(std::string("/dev/") + ep->d_name);
 	closedir(dp);
 
@@ -1859,7 +1859,7 @@ int main(int argc, char **argv)
 	memset(phys_addrs, 0xff, sizeof(phys_addrs));
 
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument)
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 589426ec..4922d1ab 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -324,7 +324,7 @@ int main(int argc, char **argv)
 	int i;
 
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument) {
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 8aa12f34..89dfe2d7 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -88,7 +88,7 @@ media_type mi_media_detect_type(const char *device)
 			const char *devname = media_types[i].devname;
 			size_t len = strlen(devname);
 
-			if (!line.compare(0, len, devname) && isdigit(line[0+len])) {
+			if (!line.compare(0, len, devname) && std::isdigit(line[0+len])) {
 				uevent_file.close();
 				return media_types[i].type;
 			}
@@ -220,7 +220,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
 		return -1;
 	media_path[0] = 0;
 	while ((ep = readdir(dp))) {
-		if (!memcmp(ep->d_name, "media", 5) && isdigit(ep->d_name[5])) {
+		if (!memcmp(ep->d_name, "media", 5) && std::isdigit(ep->d_name[5])) {
 			struct media_device_info mdinfo;
 			std::string devname("/dev/");
 
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index f6e60918..6741e358 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -498,7 +498,7 @@ std::string cec_device_find(const char *driver, const char *adapter)
 		return name;
 	}
 	while ((ep = readdir(dp)))
-		if (!memcmp(ep->d_name, "cec", 3) && isdigit(ep->d_name[3])) {
+		if (!memcmp(ep->d_name, "cec", 3) && std::isdigit(ep->d_name[3])) {
 			std::string devname("/dev/");
 			struct cec_caps caps;
 			int fd;
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 8c869fec..4621b7f6 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -178,7 +178,7 @@ int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
 
 static unsigned parse_enum(const char *value, const struct cec_arg *a)
 {
-	if (isdigit(*value))
+	if (std::isdigit(*value))
 		return strtoul(value, NULL, 0);
 	for (int i = 0; i < a->num_enum_values; i++) {
 		if (!strcmp(value, a->values[i].type_name))
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 73fc7e3c..1da70fa0 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -751,7 +751,7 @@ static int parse_cl(int argc, char **argv)
 		std::exit(EXIT_FAILURE);
 	}
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument)
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 5b715fa5..13f14346 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -835,7 +835,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
 	while ((ep = readdir(dp))) {
 		const char *name = ep->d_name;
 
-		if (!memcmp(name, "media", 5) && isdigit(name[5])) {
+		if (!memcmp(name, "media", 5) && std::isdigit(name[5])) {
 			struct media_device_info mdi;
 			media_devname = std::string("/dev/") + name;
 
@@ -1510,7 +1510,7 @@ int main(int argc, char **argv)
 	}
 
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 47f5da1a..44d0c060 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -141,7 +141,7 @@ static bool is_v4l_dev(const char *name)
 		unsigned l = strlen(prefixes[i]);
 
 		if (!memcmp(name, prefixes[i], l)) {
-			if (isdigit(name[l]))
+			if (std::isdigit(name[l]))
 				return true;
 		}
 	}
@@ -339,11 +339,11 @@ static std::string name2var(const char *name)
 	int add_underscore = 0;
 
 	while (*name) {
-		if (isalnum(*name)) {
+		if (std::isalnum(*name)) {
 			if (add_underscore)
 				s += '_';
 			add_underscore = 0;
-			s += std::string(1, tolower(*name));
+			s += std::string(1, std::tolower(*name));
 		}
 		else if (s.length()) add_underscore = 1;
 		name++;
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index b13d8209..932d561f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -260,7 +260,7 @@ static void read_edid_file(FILE *f, struct v4l2_edid *e)
 		/* Handle '0x' prefix */
 		if ((i & 1) && value[0] == '0' && (c == 'x' || c == 'X'))
 			i--;
-		if (!isxdigit(c))
+		if (!std::isxdigit(c))
 			continue;
 		if (i & 0x01) {
 			value[1] = c;
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 8dd06c43..f36f8fbd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -79,7 +79,7 @@ void stds_usage()
 static v4l2_std_id parse_pal(const char *pal)
 {
 	if (pal[0] == '-') {
-		switch (tolower(pal[1])) {
+		switch (std::tolower(pal[1])) {
 			case '6':
 				return V4L2_STD_PAL_60;
 			case 'b':
@@ -88,7 +88,7 @@ static v4l2_std_id parse_pal(const char *pal)
 			case 'h':
 				return V4L2_STD_PAL_H;
 			case 'n':
-				if (tolower(pal[2]) == 'c')
+				if (std::tolower(pal[2]) == 'c')
 					return V4L2_STD_PAL_Nc;
 				return V4L2_STD_PAL_N;
 			case 'i':
@@ -108,7 +108,7 @@ static v4l2_std_id parse_pal(const char *pal)
 static v4l2_std_id parse_secam(const char *secam)
 {
 	if (secam[0] == '-') {
-		switch (tolower(secam[1])) {
+		switch (std::tolower(secam[1])) {
 			case 'b':
 			case 'g':
 			case 'h':
@@ -117,7 +117,7 @@ static v4l2_std_id parse_secam(const char *secam)
 			case 'k':
 				return V4L2_STD_SECAM_DK;
 			case 'l':
-				if (tolower(secam[2]) == 'c')
+				if (std::tolower(secam[2]) == 'c')
 					return V4L2_STD_SECAM_LC;
 				return V4L2_STD_SECAM_L;
 		}
@@ -130,7 +130,7 @@ static v4l2_std_id parse_secam(const char *secam)
 static v4l2_std_id parse_ntsc(const char *ntsc)
 {
 	if (ntsc[0] == '-') {
-		switch (tolower(ntsc[1])) {
+		switch (std::tolower(ntsc[1])) {
 			case 'm':
 				return V4L2_STD_NTSC_M;
 			case 'j':
@@ -459,7 +459,7 @@ void stds_cmd(int ch, char *optarg)
 			else
 				standard = V4L2_STD_SECAM;
 		}
-		else if (isdigit(optarg[0])) {
+		else if (std::isdigit(optarg[0])) {
 			standard = strtol(optarg, 0L, 0) | (1ULL << 63);
 		} else {
 			fprintf(stderr, "Unknown standard '%s'\n", optarg);
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 6e920c1d..730cbf38 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -123,7 +123,7 @@ void vidcap_cmd(int ch, char *optarg)
 							   optarg[2], optarg[3]);
 			if (be_pixfmt)
 				frmsize.pixel_format |= 1U << 31;
-		} else if (isdigit(optarg[0])) {
+		} else if (std::isdigit(optarg[0])) {
 			frmsize.pixel_format = strtol(optarg, 0L, 0);
 		} else {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
@@ -155,7 +155,7 @@ void vidcap_cmd(int ch, char *optarg)
 							    value[2], value[3]);
 					if (be_pixfmt)
 						frmival.pixel_format |= 1U << 31;
-				} else if (isdigit(optarg[0])) {
+				} else if (std::isdigit(optarg[0])) {
 					frmival.pixel_format = strtol(value, 0L, 0);
 				} else {
 					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index f8187fea..0f6aacb0 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -791,7 +791,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 						    value[2], value[3]);
 				if (be_pixfmt)
 					pixelformat |= 1U << 31;
-			} else if (isdigit(value[0])) {
+			} else if (std::isdigit(value[0])) {
 				pixelformat = strtol(value, 0L, 0);
 			} else {
 				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
@@ -926,7 +926,7 @@ static __u32 parse_event(const char *e, const char **name)
 	__u32 event = 0;
 
 	*name = "0";
-	if (isdigit(e[0])) {
+	if (std::isdigit(e[0])) {
 		event = strtoul(e, 0L, 0);
 		if (event == V4L2_EVENT_CTRL) {
 			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
@@ -1008,7 +1008,7 @@ static int open_media_bus_info(const std::string &bus_info)
 	while ((ep = readdir(dp))) {
 		const char *name = ep->d_name;
 
-		if (!memcmp(name, "media", 5) && isdigit(name[5])) {
+		if (!memcmp(name, "media", 5) && std::isdigit(name[5])) {
 			struct media_device_info mdi;
 			std::string devname = std::string("/dev/") + name;
 
@@ -1135,7 +1135,7 @@ int main(int argc, char **argv)
 		return 0;
 	}
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument) {
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 86266376..7b53f1ee 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -431,7 +431,7 @@ int main(int argc, char **argv)
 		std::exit(EXIT_SUCCESS);
 	}
 	for (i = 0; long_options[i].name; i++) {
-		if (!isalpha(long_options[i].val))
+		if (!std::isalpha(long_options[i].val))
 			continue;
 		short_options[idx++] = long_options[i].val;
 		if (long_options[i].has_arg == required_argument) {
@@ -479,7 +479,7 @@ int main(int argc, char **argv)
 			break;
 
 		case OptChip:
-			if (!memcmp(optarg, "subdev", 6) && isdigit(optarg[6])) {
+			if (!memcmp(optarg, "subdev", 6) && std::isdigit(optarg[6])) {
 				match.type = V4L2_CHIP_MATCH_SUBDEV;
 				match.addr = strtoul(optarg + 6, NULL, 0);
 				break;
-- 
2.25.3

