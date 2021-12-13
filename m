Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70D94738B6
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244254AbhLMXnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243542AbhLMXnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:43:08 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCBDC061748
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:08 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a9so29658901wrr.8
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Sm43MlLMN3sE4KKkoCXQEwEwVx8aKp2ER1tS++CTyNI=;
        b=YPMnFM1VM/FyFKSY1fcFkk7UfPUvRTk1PYvIp+/mi3Joun1Pm4vf/cwYklXI792yr+
         0oEBketxHCxNCU4vTZcejyFL3P3/d7FQojHTnIZE7zKN0QqsDZEXtW7RvOqL52A532bX
         yLhirNq12tHMc5r78fzpe5JO5BrXzHnlQmPCyPJiLm9HA7XLSiipQi2+R1LT70mR3nEm
         yNih5m2tAZ0ZAXw0/p7hyu2YGtQIbUaEXYxETMuFkNN1j9e3OWEFLBy1vbFJwZegeQu4
         z0Zrj6lrRFJkdnfaNYMoiDyNq4GmAnRUdFKS/Mjw/NBwoIa5VyxWif817ZPWRde6PU4e
         oiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sm43MlLMN3sE4KKkoCXQEwEwVx8aKp2ER1tS++CTyNI=;
        b=5NJbv/G6+gv6rIBBEzizsYBIbLUAPwCJ3CP5KbaJ8RYJylZlusmykMYczfcOmBNJTE
         7RumtpGMvQ8Ejn7YgA0dQ97NOQBkiW1ez+77UkqKfGMXzf1qh/y32t7os6nE0Jkr+05S
         5qFNzwBuw/y5+nw3z7w6oD6v0FzU3kHJHn0vMv9qLws4wWWU3wya8sM3gAE+WvPDWx+q
         d9eI+2AOYwhKZNgZZsLTe9Y5uCdDrIa6uWJvsx47Esbz9Jg6yLdWhIp6N0Euldvx1hf0
         NfFaNjSqJqDkeTxMP+hhjft3ISiXD73ZftjBm8wt4896FPXybqlpj6SbM73gyuoF7Ux7
         M74w==
X-Gm-Message-State: AOAM532/RNI7dGvKhMKw0joixbmqijx+A+kIAzoY1aNRpq52xnHDDnF6
        23j5Bqa0HzvSxcMEYQwAZpf8BYUzT40=
X-Google-Smtp-Source: ABdhPJxvMb/tBVECutU9Olmk+aUmld8oPcnJlXMXiptv39Tt/ISlfsqBSv7oMdZ+Zb7EjMuZUAgPyg==
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr1735185wrs.695.1639438987037;
        Mon, 13 Dec 2021 15:43:07 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p19sm435516wmq.4.2021.12.13.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:43:06 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [v4l-utils 2/3] mc_nextgen_test: Display ancillary links
Date:   Mon, 13 Dec 2021 23:42:57 +0000
Message-Id: <20211213234258.41411-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213234258.41411-1-djrscally@gmail.com>
References: <20211213234258.41411-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an argument to toggle display of ancillary links in the output of
mc_nextgen_test. Update media_show_links() to account for the extra
type of link and display them if configured by the right option.

The optargs table is reformatted, since with the new option name it
doesn't really fit in the original indentations.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Alternatively the ancillary-links could be "ancl-links" or something to try and
make it fit in the existing structure, but that seemed much uglier.

 contrib/test/mc_nextgen_test.c | 61 ++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/contrib/test/mc_nextgen_test.c b/contrib/test/mc_nextgen_test.c
index b8c26045..6086ceb4 100644
--- a/contrib/test/mc_nextgen_test.c
+++ b/contrib/test/mc_nextgen_test.c
@@ -47,17 +47,18 @@ const char *argp_program_bug_address = "Mauro Carvalho Chehab <mchehab@kernel.or
 static const char doc[] = "\nA testing tool for the MC next geneneration API\n";
 
 static const struct argp_option options[] = {
-	{"entities",	'e',	0,		0,	"show entities", 0},
-	{"interfaces",	'i',	0,		0,	"show pads", 0},
-	{"data-links",	'l',	0,		0,	"show data links", 0},
-	{"intf-links",	'I',	0,		0,	"show interface links", 0},
-	{"dot",		'D',	0,		0,	"show in Graphviz format", 0},
-	{"max_tsout",	't',	"NUM_TSOUT",	0,	"max number of DTV TS out entities/interfaces in graphviz output (default: 5)", 0},
-	{"device",	'd',	"DEVICE",	0,	"media controller device (default: /dev/media0", 0},
-
-	{"help",        '?',	0,		0,	"Give this help list", -1},
-	{"usage",	-3,	0,		0,	"Give a short usage message"},
-	{"version",	'V',	0,		0,	"Print program version", -1},
+	{"entities",		'e',	0,		0,	"show entities", 0},
+	{"interfaces",		'i',	0,		0,	"show pads", 0},
+	{"data-links",		'l',	0,		0,	"show data links", 0},
+	{"intf-links",		'I',	0,		0,	"show interface links", 0},
+	{"ancillary-links",	'a',	0,		0,	"show ancillary links", 0},
+	{"dot",			'D',	0,		0,	"show in Graphviz format", 0},
+	{"max_tsout",		't',	"NUM_TSOUT",	0,	"max number of DTV TS out entities/interfaces in graphviz output (default: 5)", 0},
+	{"device",		'd',	"DEVICE",	0,	"media controller device (default: /dev/media0", 0},
+
+	{"help",		'?',	0,		0,	"Give this help list", -1},
+	{"usage",		-3,	0,		0,	"Give a short usage message"},
+	{"version",		'V',	0,		0,	"Print program version", -1},
 	{ 0, 0, 0, 0, 0, 0 }
 };
 
@@ -65,6 +66,7 @@ static int show_entities = 0;
 static int show_interfaces = 0;
 static int show_data_links = 0;
 static int show_intf_links = 0;
+static int show_ancillary_links = 0;
 static int show_dot = 0;
 static int max_tsout = 5;
 static char media_device[256] = "/dev/media0";
@@ -90,6 +92,9 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 	case 'I':
 		show_intf_links++;
 		break;
+	case 'a':
+		show_ancillary_links++;
+		break;
 	case 'D':
 		show_dot++;
 		break;
@@ -659,29 +664,41 @@ static void media_show_links(struct media_controller *mc)
 		struct media_v2_link *link = &links[i];
 		char *obj, *source_obj, *sink_obj;
 
-		color = BLUE;
-		if (media_type(link->source_id) == MEDIA_GRAPH_PAD) {
+		__u32 type = link->flags & MEDIA_LNK_FL_LINK_TYPE;
+
+		color = CYAN;
+		switch (type) {
+		case MEDIA_LNK_FL_DATA_LINK:
 			if (!show_data_links)
 				continue;
-			color = CYAN;
-		}
 
-		if (media_type(link->source_id) == MEDIA_GRAPH_INTF_DEVNODE) {
+			show(color, 0, "data");
+
+			break;
+		case MEDIA_LNK_FL_INTERFACE_LINK:
 			if (!show_intf_links)
 				continue;
+
+			color = BLUE;
+			show(color, 0, "interface");
+
+			break;
+		case MEDIA_LNK_FL_ANCILLARY_LINK:
+			if (!show_ancillary_links)
+				continue;
+
+			color = MAGENTA;
+			show(color, 0, "ancillary");
+			break;
 		}
 
 		obj = objname(link->id, '#');
 		source_obj = objname(link->source_id, '#');
 		sink_obj = objname(link->sink_id, '#');
 
-		if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_INTERFACE_LINK)
-			show(color, 0, "interface ");
-		else
-			show(color, 0, "data ");
 		show(color, 0, "link %s: %s %s %s",
 		     obj, source_obj,
-		     ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_INTERFACE_LINK) ? "<=>" : "=>",
+		     ((type) == MEDIA_LNK_FL_DATA_LINK) ? "=>" : "<=>",
 		     sink_obj);
 		if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
 			show(color, 0, " [IMMUTABLE]");
@@ -1117,7 +1134,7 @@ int main(int argc, char *argv[])
 		if (show_interfaces)
 			media_show_interfaces(mc);
 
-		if (show_data_links || show_intf_links)
+		if (show_data_links || show_intf_links || show_ancillary_links)
 			media_show_links(mc);
 	}
 
-- 
2.25.1

