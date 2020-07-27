Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E85F22E450
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgG0DPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgG0DPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB2DC0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:06 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id s26so8268034pfm.4
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9EMgT8/aP3c2ODsEnmnVzmUBZxFmZkvvzlesS9fKDh0=;
        b=JPxmzxXbJ2gB/LjwiV2RIk//7Ov5MMRJGilhoE/eAfJkDgLB2ut/27L/w6Fr/Bx9/V
         Xw8TMKJPCi7TTXbs7z2JZxtoWN+EUJQi9OCGkij+tJ3j7q1o/HuYNtL2EsIhqherV8wo
         mRf8/mPkLStjU5J4EF3eRjelFS/O+i0rAlr/8yA6jpnX21Nf6BDCJxcM7evObjnAgrFM
         cgX7rY3vgLr1UBMO7oB9amsZusbMvdTMib4ZRjYj2bRachS2+PSMqWt/FkPvYDLw/73H
         b2B2d0iggLDl8OmYobN6r1oQIf9US2xdPps0Kov6ykA91LRTwsiBhVZ5Rfdhgi2LULRr
         zNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EMgT8/aP3c2ODsEnmnVzmUBZxFmZkvvzlesS9fKDh0=;
        b=OGyxWRsl9BxKRiQvBlCMqFYRGZ7ngLeqq2wJTBtguUvcRnpfaj0nv+Xvamw4qjyRTs
         uFOo6DmlGZg3zsKIg/lphm46MDbPL1U0YmnYwpfDr4wboqtwrCcLSUzSJ37P9FANTomy
         ESYD226dz4pRAk3qJmxMfsfrGTHY8D/DkOfwPPA80yAtwsgyBsgA1Wsq0kKaxJ9CYwfm
         jxu7/FEX8ttkAgq2VQ6dKoPVPAddJto5rfTkOjplsrqSdqEfvpw/7p4yRY3F3mKUbKZP
         hJlBZ9Gn/LQUB6A3uWNB+Q0c9DIQymkBWaqP7Fhm6VyDiq2VbhZ9Qm7YmTYQuRNfmbKD
         k1zA==
X-Gm-Message-State: AOAM532iMNuLBWehlZoaF6gGpDQrQzcXpuSqRdjDXlp4oMlL7npMEatn
        6yrv84PWUWnW4R/EgLHkQG7ji/5u+pU=
X-Google-Smtp-Source: ABdhPJycZc8xeFVCMD2WCeNGCIdrMesJsTFRh1NmPSJBwjydG0HeaYm0WR95VLdx+4GzTjao64LXJw==
X-Received: by 2002:a63:fa15:: with SMTP id y21mr17855798pgh.339.1595819704923;
        Sun, 26 Jul 2020 20:15:04 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.15.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:15:04 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/8] [clang-tidy] fix mismatching declarations
Date:   Sun, 26 Jul 2020 20:14:55 -0700
Message-Id: <20200727031456.232955-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with readability-inconsistent-declaration-parameter-name

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/include/libdvbv5/atsc_eit.h               |  4 +-
 lib/include/libdvbv5/cat.h                    |  4 +-
 lib/include/libdvbv5/descriptors.h            |  2 +-
 lib/include/libdvbv5/dvb-demux.h              |  2 +-
 lib/include/libdvbv5/dvb-dev.h                |  2 +-
 lib/include/libdvbv5/dvb-fe.h                 |  2 +-
 lib/include/libdvbv5/dvb-file.h               |  4 +-
 lib/include/libdvbv5/dvb-scan.h               | 16 +++----
 lib/include/libdvbv5/eit.h                    |  4 +-
 lib/include/libdvbv5/header.h                 |  4 +-
 lib/include/libdvbv5/mgt.h                    |  4 +-
 lib/include/libdvbv5/mpeg_pes.h               |  2 +-
 lib/include/libdvbv5/nit.h                    |  6 +--
 lib/include/libdvbv5/pat.h                    |  4 +-
 lib/include/libdvbv5/pmt.h                    |  4 +-
 lib/include/libdvbv5/sdt.h                    |  4 +-
 lib/include/libdvbv5/vct.h                    |  4 +-
 lib/include/libv4l2.h                         |  2 +-
 lib/libdvbv5/parse_string.h                   |  2 +-
 lib/libv4lconvert/libv4lconvert-priv.h        | 48 +++++++++----------
 .../processing/libv4lprocessing.h             |  2 +-
 lib/libv4lconvert/tinyjpeg.h                  |  2 +-
 utils/common/v4l-stream.h                     |  4 +-
 utils/keytable/bpf.h                          |  6 +--
 utils/libcecutil/cec-log.cpp                  | 12 ++---
 25 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/lib/include/libdvbv5/atsc_eit.h b/lib/include/libdvbv5/atsc_eit.h
index 5e52087c..18ae599d 100644
--- a/lib/include/libdvbv5/atsc_eit.h
+++ b/lib/include/libdvbv5/atsc_eit.h
@@ -192,7 +192,7 @@ ssize_t atsc_table_eit_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct atsc_table_eit to be freed
  */
-void atsc_table_eit_free(struct atsc_table_eit *table);
+void atsc_table_eit_free(struct atsc_table_eit *eit);
 
 /**
  * @brief Prints the content of the ATSC EIT table
@@ -202,7 +202,7 @@ void atsc_table_eit_free(struct atsc_table_eit *table);
  * @param table pointer to struct atsc_table_eit
  */
 void atsc_table_eit_print(struct dvb_v5_fe_parms *parms,
-			  struct atsc_table_eit *table);
+			  struct atsc_table_eit *eit);
 
 /**
  * @brief Converts an ATSC EIT formatted timestamp into struct tm
diff --git a/lib/include/libdvbv5/cat.h b/lib/include/libdvbv5/cat.h
index 612c2c35..2e767ddc 100644
--- a/lib/include/libdvbv5/cat.h
+++ b/lib/include/libdvbv5/cat.h
@@ -88,7 +88,7 @@ ssize_t dvb_table_cat_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_cat to be freed
  */
-void dvb_table_cat_free(struct dvb_table_cat *table);
+void dvb_table_cat_free(struct dvb_table_cat *cat);
 
 /**
  * @brief Prints the content of the CAT table
@@ -97,7 +97,7 @@ void dvb_table_cat_free(struct dvb_table_cat *table);
  * @param table pointer to struct dvb_table_cat
  */
 void dvb_table_cat_print(struct dvb_v5_fe_parms *parms,
-			 struct dvb_table_cat *table);
+			 struct dvb_table_cat *cat);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/descriptors.h b/lib/include/libdvbv5/descriptors.h
index cb21470c..8f3900f2 100644
--- a/lib/include/libdvbv5/descriptors.h
+++ b/lib/include/libdvbv5/descriptors.h
@@ -157,7 +157,7 @@ uint32_t dvb_bcd(uint32_t bcd);
  * @param len		Number of bytes to show
  */
 void dvb_hexdump(struct dvb_v5_fe_parms *parms, const char *prefix,
-		 const unsigned char *buf, int len);
+		 const unsigned char *data, int len);
 
 /**
  * @brief parse MPEG-TS descriptors
diff --git a/lib/include/libdvbv5/dvb-demux.h b/lib/include/libdvbv5/dvb-demux.h
index 971c27f6..d3bc02a9 100644
--- a/lib/include/libdvbv5/dvb-demux.h
+++ b/lib/include/libdvbv5/dvb-demux.h
@@ -148,7 +148,7 @@ int dvb_set_section_filter(int dmxfd, int pid, unsigned filtsize,
  *
  * @warning This function currently assumes that the PAT fits into one session.
  */
-int dvb_get_pmt_pid(int dmxfd, int sid);
+int dvb_get_pmt_pid(int patfd, int sid);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/dvb-dev.h b/lib/include/libdvbv5/dvb-dev.h
index 2eeae516..5a9cc1a2 100644
--- a/lib/include/libdvbv5/dvb-dev.h
+++ b/lib/include/libdvbv5/dvb-dev.h
@@ -398,7 +398,7 @@ int dvb_dev_set_bufsize(struct dvb_open_descriptor *open_dev,
  */
 int dvb_dev_dmx_set_pesfilter(struct dvb_open_descriptor *open_dev,
 			      int pid, dmx_pes_type_t type,
-			      dmx_output_t output, int buffersize);
+			      dmx_output_t output, int bufsize);
 
 /**
  * @brief Sets a MPEG-TS section filter
diff --git a/lib/include/libdvbv5/dvb-fe.h b/lib/include/libdvbv5/dvb-fe.h
index 96657013..4bd94108 100644
--- a/lib/include/libdvbv5/dvb-fe.h
+++ b/lib/include/libdvbv5/dvb-fe.h
@@ -732,7 +732,7 @@ int dvb_fe_is_satellite(uint32_t delivery_system);
  * "COUNTRY" property in dvb_fe_set_parm() overrides the setting.
  */
 int dvb_fe_set_default_country(struct dvb_v5_fe_parms *parms,
-			       const char *country);
+			       const char *cc);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/dvb-file.h b/lib/include/libdvbv5/dvb-file.h
index 1f1a6386..9c8c54d9 100644
--- a/lib/include/libdvbv5/dvb-file.h
+++ b/lib/include/libdvbv5/dvb-file.h
@@ -423,8 +423,8 @@ int dvb_retrieve_entry_prop(struct dvb_entry *entry,
  * @return Returns 0 if success, or, -1 if error.
  */
 int dvb_store_channel(struct dvb_file **dvb_file,
-		      struct dvb_v5_fe_parms *parms,
-		      struct dvb_v5_descriptors *dvb_desc,
+		      struct dvb_v5_fe_parms *__p,
+		      struct dvb_v5_descriptors *dvb_scan_handler,
 		      int get_detected, int get_nit);
 
 /**
diff --git a/lib/include/libdvbv5/dvb-scan.h b/lib/include/libdvbv5/dvb-scan.h
index 2666d906..50846b98 100644
--- a/lib/include/libdvbv5/dvb-scan.h
+++ b/lib/include/libdvbv5/dvb-scan.h
@@ -222,7 +222,7 @@ int dvb_read_section(struct dvb_v5_fe_parms *parms, int dmx_fd,
  * This is a variant of dvb_read_section() that uses a struct dvb_table_filter
  * to specify the filter to use.
  */
-int dvb_read_sections(struct dvb_v5_fe_parms *parms, int dmx_fd,
+int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 			     struct dvb_table_filter *sect,
 			     unsigned timeout);
 
@@ -265,7 +265,7 @@ void dvb_scan_free_handler_table(struct dvb_v5_descriptors *dvb_scan_handler);
  * On sucess, it returns a pointer to a struct dvb_v5_descriptors, that can
  * either be used to tune into a service or to be stored inside a file.
  */
-struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *parms, int dmx_fd,
+struct dvb_v5_descriptors *dvb_get_ts_tables(struct dvb_v5_fe_parms *__p, int dmx_fd,
 					  uint32_t delivery_system,
 					  unsigned other_nit,
 					  unsigned timeout_multiply);
@@ -337,7 +337,7 @@ typedef int (check_frontend_t)(void *args, struct dvb_v5_fe_parms *parms);
  * }
  * @endcode
  */
-struct dvb_v5_descriptors *dvb_scan_transponder(struct dvb_v5_fe_parms *parms,
+struct dvb_v5_descriptors *dvb_scan_transponder(struct dvb_v5_fe_parms *__p,
 						struct dvb_entry *entry,
 						int dmx_fd,
 						check_frontend_t *check_frontend,
@@ -388,7 +388,7 @@ struct dvb_v5_descriptors *dvb_scan_transponder(struct dvb_v5_fe_parms *parms,
  * }
  * @endcode
  */
-void dvb_add_scaned_transponders(struct dvb_v5_fe_parms *parms,
+void dvb_add_scaned_transponders(struct dvb_v5_fe_parms *__p,
 				 struct dvb_v5_descriptors *dvb_scan_handler,
 				 struct dvb_entry *first_entry,
 				 struct dvb_entry *entry);
@@ -398,12 +398,12 @@ void dvb_add_scaned_transponders(struct dvb_v5_fe_parms *parms,
  * Some ancillary functions used internally inside the library, used to
  * identify duplicated transport streams and add new found transponder entries
  */
-int dvb_estimate_freq_shift(struct dvb_v5_fe_parms *parms);
+int dvb_estimate_freq_shift(struct dvb_v5_fe_parms *__p);
 
 int dvb_new_freq_is_needed(struct dvb_entry *entry, struct dvb_entry *last_entry,
 			   uint32_t freq, enum dvb_sat_polarization pol, int shift);
 
-struct dvb_entry *dvb_scan_add_entry(struct dvb_v5_fe_parms *parms,
+struct dvb_entry *dvb_scan_add_entry(struct dvb_v5_fe_parms *__p,
 				     struct dvb_entry *first_entry,
 			             struct dvb_entry *entry,
 			             uint32_t freq, uint32_t shift,
@@ -414,14 +414,14 @@ int dvb_new_entry_is_needed(struct dvb_entry *entry,
 			    uint32_t freq, int shift,
 			    enum dvb_sat_polarization pol, uint32_t stream_id);
 
-struct dvb_entry *dvb_scan_add_entry_ex(struct dvb_v5_fe_parms *parms,
+struct dvb_entry *dvb_scan_add_entry_ex(struct dvb_v5_fe_parms *__p,
 					struct dvb_entry *first_entry,
 					struct dvb_entry *entry,
 					uint32_t freq, uint32_t shift,
 					enum dvb_sat_polarization pol,
 					uint32_t stream_id);
 
-void dvb_update_transponders(struct dvb_v5_fe_parms *parms,
+void dvb_update_transponders(struct dvb_v5_fe_parms *__p,
 			     struct dvb_v5_descriptors *dvb_scan_handler,
 			     struct dvb_entry *first_entry,
 			     struct dvb_entry *entry);
diff --git a/lib/include/libdvbv5/eit.h b/lib/include/libdvbv5/eit.h
index 9129861e..5510707b 100644
--- a/lib/include/libdvbv5/eit.h
+++ b/lib/include/libdvbv5/eit.h
@@ -197,7 +197,7 @@ ssize_t dvb_table_eit_init (struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_eit to be freed
  */
-void dvb_table_eit_free(struct dvb_table_eit *table);
+void dvb_table_eit_free(struct dvb_table_eit *eit);
 
 /**
  * @brief Prints the content of the DVB EIT table
@@ -207,7 +207,7 @@ void dvb_table_eit_free(struct dvb_table_eit *table);
  * @param table pointer to struct dvb_table_eit
  */
 void dvb_table_eit_print(struct dvb_v5_fe_parms *parms,
-			 struct dvb_table_eit *table);
+			 struct dvb_table_eit *eit);
 
 /**
  * @brief Converts a DVB EIT formatted timestamp into struct tm
diff --git a/lib/include/libdvbv5/header.h b/lib/include/libdvbv5/header.h
index 2a459f9d..ccf67422 100644
--- a/lib/include/libdvbv5/header.h
+++ b/lib/include/libdvbv5/header.h
@@ -132,7 +132,7 @@ extern "C" {
  *
  * @param header pointer to struct dvb_table_header to be parsed
  */
-void dvb_table_header_init (struct dvb_table_header *header);
+void dvb_table_header_init (struct dvb_table_header *t);
 /**
  * @brief Prints the content of the MPEG-TS table header
  * @ingroup dvb_table
@@ -141,7 +141,7 @@ void dvb_table_header_init (struct dvb_table_header *header);
  * @param header pointer to struct dvb_table_header to be printed
  */
 void dvb_table_header_print(struct dvb_v5_fe_parms *parms,
-			    const struct dvb_table_header *header);
+			    const struct dvb_table_header *t);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/mgt.h b/lib/include/libdvbv5/mgt.h
index 7aa92d6c..62b5a7ab 100644
--- a/lib/include/libdvbv5/mgt.h
+++ b/lib/include/libdvbv5/mgt.h
@@ -168,7 +168,7 @@ ssize_t atsc_table_mgt_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct atsc_table_mgt to be freed
  */
-void atsc_table_mgt_free(struct atsc_table_mgt *table);
+void atsc_table_mgt_free(struct atsc_table_mgt *mgt);
 
 /**
  * @brief Prints the content of the MGT table
@@ -178,7 +178,7 @@ void atsc_table_mgt_free(struct atsc_table_mgt *table);
  * @param table pointer to struct atsc_table_mgt
  */
 void atsc_table_mgt_print(struct dvb_v5_fe_parms *parms,
-			  struct atsc_table_mgt *table);
+			  struct atsc_table_mgt *mgt);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/mpeg_pes.h b/lib/include/libdvbv5/mpeg_pes.h
index 9f214b26..b2b13584 100644
--- a/lib/include/libdvbv5/mpeg_pes.h
+++ b/lib/include/libdvbv5/mpeg_pes.h
@@ -228,7 +228,7 @@ ssize_t dvb_mpeg_pes_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf, ssi
  * If the pointer pes was allocated dynamically, this function
  * can be used to free the memory.
  */
-void dvb_mpeg_pes_free(struct dvb_mpeg_pes *pes);
+void dvb_mpeg_pes_free(struct dvb_mpeg_pes *ts);
 
 /**
  * @brief Print details of struct dvb_mpeg_pes
diff --git a/lib/include/libdvbv5/nit.h b/lib/include/libdvbv5/nit.h
index f8e0e730..ef0f1bc1 100644
--- a/lib/include/libdvbv5/nit.h
+++ b/lib/include/libdvbv5/nit.h
@@ -221,7 +221,7 @@ ssize_t dvb_table_nit_init (struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_nit to be freed
  */
-void dvb_table_nit_free(struct dvb_table_nit *table);
+void dvb_table_nit_free(struct dvb_table_nit *nit);
 
 /**
  * @brief Prints the content of the NIT table
@@ -230,7 +230,7 @@ void dvb_table_nit_free(struct dvb_table_nit *table);
  * @param parms	struct dvb_v5_fe_parms pointer to the opened device
  * @param table	pointer to struct dvb_table_nit
  */
-void dvb_table_nit_print(struct dvb_v5_fe_parms *parms, struct dvb_table_nit *table);
+void dvb_table_nit_print(struct dvb_v5_fe_parms *parms, struct dvb_table_nit *nit);
 
 /**
  * @brief For each entry at NIT and NIT transport tables, call a callback
@@ -263,7 +263,7 @@ void dvb_table_nit_print(struct dvb_v5_fe_parms *parms, struct dvb_table_nit *ta
  */
 void dvb_table_nit_descriptor_handler(
 			    struct dvb_v5_fe_parms *parms,
-			    struct dvb_table_nit *table,
+			    struct dvb_table_nit *nit,
 			    enum descriptors descriptor,
 			    nit_handler_callback_t *call_nit,
 			    nit_tran_handler_callback_t *call_tran,
diff --git a/lib/include/libdvbv5/pat.h b/lib/include/libdvbv5/pat.h
index bdf31ab5..9b1303a1 100644
--- a/lib/include/libdvbv5/pat.h
+++ b/lib/include/libdvbv5/pat.h
@@ -153,7 +153,7 @@ ssize_t dvb_table_pat_init (struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_pat to be freed
  */
-void dvb_table_pat_free(struct dvb_table_pat *table);
+void dvb_table_pat_free(struct dvb_table_pat *pat);
 
 /**
  * @brief Prints the content of the PAT table
@@ -163,7 +163,7 @@ void dvb_table_pat_free(struct dvb_table_pat *table);
  * @param table pointer to struct dvb_table_pat
  */
 void dvb_table_pat_print(struct dvb_v5_fe_parms *parms,
-			 struct dvb_table_pat *table);
+			 struct dvb_table_pat *pat);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/pmt.h b/lib/include/libdvbv5/pmt.h
index 5876c594..45ce88b0 100644
--- a/lib/include/libdvbv5/pmt.h
+++ b/lib/include/libdvbv5/pmt.h
@@ -281,7 +281,7 @@ ssize_t dvb_table_pmt_init (struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_pmt to be freed
  */
-void dvb_table_pmt_free(struct dvb_table_pmt *table);
+void dvb_table_pmt_free(struct dvb_table_pmt *pmt);
 
 /**
  * @brief Prints the content of the PAT table
@@ -291,7 +291,7 @@ void dvb_table_pmt_free(struct dvb_table_pmt *table);
  * @param table pointer to struct dvb_table_pmt
  */
 void dvb_table_pmt_print(struct dvb_v5_fe_parms *parms,
-			 const struct dvb_table_pmt *table);
+			 const struct dvb_table_pmt *pmt);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/sdt.h b/lib/include/libdvbv5/sdt.h
index 52fdf07f..1292f82d 100644
--- a/lib/include/libdvbv5/sdt.h
+++ b/lib/include/libdvbv5/sdt.h
@@ -169,7 +169,7 @@ ssize_t dvb_table_sdt_init (struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct dvb_table_sdt to be freed
  */
-void dvb_table_sdt_free(struct dvb_table_sdt *table);
+void dvb_table_sdt_free(struct dvb_table_sdt *sdt);
 
 /**
  * @brief Prints the content of the SDT table
@@ -178,7 +178,7 @@ void dvb_table_sdt_free(struct dvb_table_sdt *table);
  * @param parms	struct dvb_v5_fe_parms pointer to the opened device
  * @param table pointer to struct dvb_table_sdt
  */
-void dvb_table_sdt_print(struct dvb_v5_fe_parms *parms, struct dvb_table_sdt *table);
+void dvb_table_sdt_print(struct dvb_v5_fe_parms *parms, struct dvb_table_sdt *sdt);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libdvbv5/vct.h b/lib/include/libdvbv5/vct.h
index 374c73a8..86c4728a 100644
--- a/lib/include/libdvbv5/vct.h
+++ b/lib/include/libdvbv5/vct.h
@@ -233,7 +233,7 @@ ssize_t atsc_table_vct_init(struct dvb_v5_fe_parms *parms, const uint8_t *buf,
  *
  * @param table pointer to struct atsc_table_vct to be freed
  */
-void atsc_table_vct_free(struct atsc_table_vct *table);
+void atsc_table_vct_free(struct atsc_table_vct *vct);
 /**
  * @brief Prints the content of the VCT table
  * @ingroup dvb_table
@@ -242,7 +242,7 @@ void atsc_table_vct_free(struct atsc_table_vct *table);
  * @param table pointer to struct atsc_table_vct
  */
 void atsc_table_vct_print(struct dvb_v5_fe_parms *parms,
-			  struct atsc_table_vct *table);
+			  struct atsc_table_vct *vct);
 
 #ifdef __cplusplus
 }
diff --git a/lib/include/libv4l2.h b/lib/include/libv4l2.h
index ea1870db..5c093067 100644
--- a/lib/include/libv4l2.h
+++ b/lib/include/libv4l2.h
@@ -64,7 +64,7 @@ LIBV4L_PUBLIC int v4l2_open(const char *file, int oflag, ...);
 LIBV4L_PUBLIC int v4l2_close(int fd);
 LIBV4L_PUBLIC int v4l2_dup(int fd);
 LIBV4L_PUBLIC int v4l2_ioctl(int fd, unsigned long int request, ...);
-LIBV4L_PUBLIC ssize_t v4l2_read(int fd, void *buffer, size_t n);
+LIBV4L_PUBLIC ssize_t v4l2_read(int fd, void *dest, size_t n);
 LIBV4L_PUBLIC ssize_t v4l2_write(int fd, const void *buffer, size_t n);
 LIBV4L_PUBLIC void *v4l2_mmap(void *start, size_t length, int prot, int flags,
 		int fd, int64_t offset);
diff --git a/lib/libdvbv5/parse_string.h b/lib/libdvbv5/parse_string.h
index b0884bfb..86604bde 100644
--- a/lib/libdvbv5/parse_string.h
+++ b/lib/libdvbv5/parse_string.h
@@ -27,7 +27,7 @@ void dvb_iconv_to_charset(struct dvb_v5_fe_parms *parms,
 			  size_t destlen,
 			  const unsigned char *src,
 			  size_t len,
-			  char *type, char *output_charset);
+			  char *input_charset, char *output_charset);
 
 void dvb_parse_string(struct dvb_v5_fe_parms *parms, char **dest, char **emph,
 		      const unsigned char *src, size_t len);
diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index ce5970c9..dd168424 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -117,43 +117,43 @@ int v4lconvert_oom_error(struct v4lconvert_data *data);
 void v4lconvert_rgb24_to_yuv420(const unsigned char *src, unsigned char *dest,
 		const struct v4l2_format *src_fmt, int bgr, int yvu, int bpp);
 
-void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int yvu);
 
-void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int yvu);
 
-void v4lconvert_yuyv_to_rgb24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yuyv_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_yuyv_to_bgr24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yuyv_to_bgr24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_yuyv_to_yuv420(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yuyv_to_yuv420(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride, int yvu);
 
 void v4lconvert_nv16_to_yuyv(const unsigned char *src, unsigned char *dest,
 		int width, int height);
 
-void v4lconvert_yvyu_to_rgb24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yvyu_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_yvyu_to_bgr24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_yvyu_to_bgr24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_uyvy_to_rgb24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_uyvy_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_uyvy_to_bgr24(const unsigned char *src, unsigned char *dst,
+void v4lconvert_uyvy_to_bgr24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride);
 
-void v4lconvert_uyvy_to_yuv420(const unsigned char *src, unsigned char *dst,
+void v4lconvert_uyvy_to_yuv420(const unsigned char *src, unsigned char *dest,
 		int width, int height, int stride, int yvu);
 
 void v4lconvert_swap_rgb(const unsigned char *src, unsigned char *dst,
 		int width, int height);
 
-void v4lconvert_swap_uv(const unsigned char *src, unsigned char *dst,
+void v4lconvert_swap_uv(const unsigned char *src, unsigned char *dest,
 		const struct v4l2_format *src_fmt);
 
 void v4lconvert_grey_to_rgb24(const unsigned char *src, unsigned char *dest,
@@ -209,9 +209,9 @@ void v4lconvert_m420_to_yuv420(const unsigned char *src,
 
 int v4lconvert_cpia1_to_yuv420(struct v4lconvert_data *data,
 		const unsigned char *src, int src_size,
-		unsigned char *dst, int width, int height, int yvu);
+		unsigned char *dest, int width, int height, int yvu);
 
-void v4lconvert_sn9c20x_to_yuv420(const unsigned char *src, unsigned char *dst,
+void v4lconvert_sn9c20x_to_yuv420(const unsigned char *raw, unsigned char *i420,
 		int width, int height, int yvu);
 
 int v4lconvert_se401_to_rgb24(struct v4lconvert_data *data,
@@ -226,13 +226,13 @@ int v4lconvert_decode_jpeg_libjpeg(struct v4lconvert_data *data,
 	unsigned char *src, int src_size, unsigned char *dest,
 	struct v4l2_format *fmt, unsigned int dest_pix_fmt);
 
-int v4lconvert_decode_jpgl(const unsigned char *src, int src_size,
-	unsigned int dest_pix_fmt, unsigned char *dest, int width, int height);
+int v4lconvert_decode_jpgl(const unsigned char *inp, int src_size,
+	unsigned int dest_pix_fmt, unsigned char *fb, int width, int height);
 
-void v4lconvert_decode_spca561(const unsigned char *src, unsigned char *dst,
+void v4lconvert_decode_spca561(const unsigned char *inbuf, unsigned char *outbuf,
 		int width, int height);
 
-void v4lconvert_decode_sn9c10x(const unsigned char *src, unsigned char *dst,
+void v4lconvert_decode_sn9c10x(const unsigned char *inp, unsigned char *outp,
 		int width, int height);
 
 int v4lconvert_decode_pac207(struct v4lconvert_data *data,
@@ -240,7 +240,7 @@ int v4lconvert_decode_pac207(struct v4lconvert_data *data,
 		int width, int height);
 
 int v4lconvert_decode_mr97310a(struct v4lconvert_data *data,
-		const unsigned char *src, int src_size, unsigned char *dst,
+		const unsigned char *inp, int src_size, unsigned char *outp,
 		int width, int height);
 
 int v4lconvert_decode_jl2005bcd(struct v4lconvert_data *data,
@@ -257,10 +257,10 @@ void v4lconvert_decode_stv0680(const unsigned char *src, unsigned char *dst,
 		int width, int height);
 
 void v4lconvert_bayer_to_rgb24(const unsigned char *bayer,
-		unsigned char *rgb, int width, int height, const unsigned int stride, unsigned int pixfmt);
+		unsigned char *bgr, int width, int height, const unsigned int stride, unsigned int pixfmt);
 
 void v4lconvert_bayer_to_bgr24(const unsigned char *bayer,
-		unsigned char *rgb, int width, int height, const unsigned int stride, unsigned int pixfmt);
+		unsigned char *bgr, int width, int height, const unsigned int stride, unsigned int pixfmt);
 
 void v4lconvert_bayer_to_yuv420(const unsigned char *bayer, unsigned char *yuv,
 		int width, int height, const unsigned int stride, unsigned int src_pixfmt, int yvu);
@@ -275,13 +275,13 @@ void v4lconvert_bayer16_to_bayer8(unsigned char *bayer16,
 		unsigned char *bayer8, int width, int height);
 
 void v4lconvert_hm12_to_rgb24(const unsigned char *src,
-		unsigned char *dst, int width, int height);
+		unsigned char *dest, int width, int height);
 
 void v4lconvert_hm12_to_bgr24(const unsigned char *src,
-		unsigned char *dst, int width, int height);
+		unsigned char *dest, int width, int height);
 
 void v4lconvert_hm12_to_yuv420(const unsigned char *src,
-		unsigned char *dst, int width, int height, int yvu);
+		unsigned char *dest, int width, int height, int yvu);
 
 void v4lconvert_hsv_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int bgr, int Xin, unsigned char hsv_enc);
@@ -303,7 +303,7 @@ void v4lconvert_crop(unsigned char *src, unsigned char *dest,
 
 int v4lconvert_helper_decompress(struct v4lconvert_data *data,
 		const char *helper, const unsigned char *src, int src_size,
-		unsigned char *dest, int dest_size, int width, int height, int command);
+		unsigned char *dest, int dest_size, int width, int height, int flags);
 
 void v4lconvert_helper_cleanup(struct v4lconvert_data *data);
 
diff --git a/lib/libv4lconvert/processing/libv4lprocessing.h b/lib/libv4lconvert/processing/libv4lprocessing.h
index d135a9d6..52184a7c 100644
--- a/lib/libv4lconvert/processing/libv4lprocessing.h
+++ b/lib/libv4lconvert/processing/libv4lprocessing.h
@@ -31,7 +31,7 @@
 struct v4lprocessing_data;
 struct v4lcontrol_data;
 
-struct v4lprocessing_data *v4lprocessing_create(int fd, struct v4lcontrol_data *data);
+struct v4lprocessing_data *v4lprocessing_create(int fd, struct v4lcontrol_data *control);
 void v4lprocessing_destroy(struct v4lprocessing_data *data);
 
 /* Prepare to process 1 frame, returns 1 if processing is necesary,
diff --git a/lib/libv4lconvert/tinyjpeg.h b/lib/libv4lconvert/tinyjpeg.h
index ee61d234..857f833d 100644
--- a/lib/libv4lconvert/tinyjpeg.h
+++ b/lib/libv4lconvert/tinyjpeg.h
@@ -58,7 +58,7 @@ struct jdec_private *tinyjpeg_init(void);
 void tinyjpeg_free(struct jdec_private *priv);
 
 int tinyjpeg_parse_header(struct jdec_private *priv, const unsigned char *buf, unsigned int size);
-int tinyjpeg_decode(struct jdec_private *priv, int pixel_format);
+int tinyjpeg_decode(struct jdec_private *priv, int pixfmt);
 const char *tinyjpeg_get_errorstring(struct jdec_private *priv);
 void tinyjpeg_get_size(struct jdec_private *priv, unsigned int *width, unsigned int *height);
 int tinyjpeg_get_components(struct jdec_private *priv, unsigned char **components);
diff --git a/utils/common/v4l-stream.h b/utils/common/v4l-stream.h
index fe5dfe90..e6b6c27d 100644
--- a/utils/common/v4l-stream.h
+++ b/utils/common/v4l-stream.h
@@ -144,8 +144,8 @@ struct codec_ctx {
 	u32			comp_max_size;
 };
 
-unsigned rle_compress(__u8 *buf, unsigned size, unsigned bytesperline);
-void rle_decompress(__u8 *buf, unsigned size, unsigned rle_size, unsigned bytesperline);
+unsigned rle_compress(__u8 *buf, unsigned size, unsigned bpl);
+void rle_decompress(__u8 *buf, unsigned size, unsigned rle_size, unsigned bpl);
 struct codec_ctx *fwht_alloc(unsigned pixfmt, unsigned visible_width, unsigned visible_height,
 			     unsigned coded_width, unsigned coded_height, unsigned field,
 			     unsigned colorspace, unsigned xfer_func, unsigned ycbcr_enc,
diff --git a/utils/keytable/bpf.h b/utils/keytable/bpf.h
index fb3896c9..f09232cf 100644
--- a/utils/keytable/bpf.h
+++ b/utils/keytable/bpf.h
@@ -89,10 +89,10 @@ int bpf_map_delete_elem(int fd, const void *key);
 int bpf_map_get_next_key(int fd, const void *key, void *next_key);
 int bpf_obj_pin(int fd, const char *pathname);
 int bpf_obj_get(const char *pathname);
-int bpf_prog_attach(int prog_fd, int attachable_fd, enum bpf_attach_type type,
+int bpf_prog_attach(int prog_fd, int target_fd, enum bpf_attach_type type,
 		    unsigned int flags);
-int bpf_prog_detach(int attachable_fd, enum bpf_attach_type type);
-int bpf_prog_detach2(int prog_fd, int attachable_fd, enum bpf_attach_type type);
+int bpf_prog_detach(int target_fd, enum bpf_attach_type type);
+int bpf_prog_detach2(int prog_fd, int target_fd, enum bpf_attach_type type);
 int bpf_prog_test_run(int prog_fd, int repeat, void *data, __u32 size,
 		      void *data_out, __u32 *size_out, __u32 *retval,
 		      __u32 *duration);
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 9410c071..56676431 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -102,12 +102,12 @@ static const struct cec_arg arg_rec_src_type = {
 };
 
 static void log_digital(const char *arg_name, const struct cec_op_digital_service_id *digital);
-static void log_rec_src(const char *arg_name, const struct cec_op_record_src *rec_src);
-static void log_tuner_dev_info(const char *arg_name, const struct cec_op_tuner_device_info *tuner_dev_info);
-static void log_features(const struct cec_arg *arg, const char *arg_name, const __u8 *p);
-static void log_ui_command(const char *arg_name, const struct cec_op_ui_command *ui_cmd);
-static void log_descriptors(const char *arg_name, unsigned num, const __u32 *descriptors);
-static void log_u8_array(const char *arg_name, unsigned num, const __u8 *vals);
+static void log_rec_src(const char *arg_string, const struct cec_op_record_src *rec_src);
+static void log_tuner_dev_info(const char *arg_string, const struct cec_op_tuner_device_info *tuner_dev_info);
+static void log_features(const struct cec_arg *arg, const char *arg_string, const __u8 *p);
+static void log_ui_command(const char *arg_string, const struct cec_op_ui_command *ui_cmd);
+static void log_descriptors(const char *arg_string, unsigned num, const __u32 *descriptors);
+static void log_u8_array(const char *arg_string, unsigned num, const __u8 *vals);
 static void log_unknown_msg(const struct cec_msg *msg);
 static void log_htng_unknown_msg(const struct cec_msg *msg);
 
-- 
2.26.2

