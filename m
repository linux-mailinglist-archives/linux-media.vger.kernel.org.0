Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F8D2C23A2
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732573AbgKXLGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:33822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732515AbgKXLGi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:38 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F4662223D;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=4W8nEuqLf1l4qmAAk4YYmxvriTuI39TgBATatEapXKI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MH9MSQS5SCFyjjMNrTdXayOG60H4LGEdNM1LwU+aKK3Ic9+cWCjIR8z0jnCsUHJvD
         RDmuvFTXEEg5GF3a8EtTLBGHlkcInOy7CAql40LTdAocSplFej58d9nw0gvIP904uZ
         B9rD0gdmOCqVkAzdLEksbWxwKBhFWHy2OxvXRSps=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fai-Dt; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 30/31] media: vidtv.rst: add kernel-doc markups
Date:   Tue, 24 Nov 2020 12:06:26 +0100
Message-Id: <81aec09bba5edaee1748edd6cca8893f24d96182.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix existing issues at the kernel-doc markups and add them to
the vidtv.rst file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/vidtv.rst        | 27 +++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  2 +-
 .../media/test-drivers/vidtv/vidtv_channel.h  |  1 +
 .../media/test-drivers/vidtv/vidtv_demod.h    | 10 ++---
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  4 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  5 ++-
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  5 ++-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  | 39 ++++++++++---------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  5 ++-
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  4 +-
 10 files changed, 70 insertions(+), 32 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index 52c201798d78..673bdff919ea 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -484,3 +484,30 @@ A nice addition is to simulate some noise when the signal quality is bad by:
 - Updating the error statistics accordingly (e.g. BER, etc).
 
 - Simulating some noise in the encoded data.
+
+Functions and structs used within vidtv
+---------------------------------------
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_bridge.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_channel.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_demod.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_encoder.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_mux.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_pes.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_psi.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_s302m.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_ts.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_tuner.h
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_common.c
+
+.. kernel-doc:: drivers/media/test-drivers/vidtv/vidtv_tuner.c
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index a85068bffd0f..2528adaee27d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -34,7 +34,7 @@
  * @adapter: Represents a DTV adapter. See 'dvb_register_adapter'.
  * @demux: The demux used by the dvb_dmx_swfilter_packets() call.
  * @dmx_dev: Represents a demux device.
- * @dmx_frontend: The frontends associated with the demux.
+ * @dmx_fe: The frontends associated with the demux.
  * @i2c_adapter: The i2c_adapter associated with the bridge driver.
  * @i2c_client_demod: The i2c_clients associated with the demodulator modules.
  * @i2c_client_tuner: The i2c_clients associated with the tuner modules.
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
index 4bc2a4c0980d..fff2e501d375 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -39,6 +39,7 @@
  * Every stream will have its corresponding encoder polled to produce TS packets
  * These packets may be interleaved by the mux and then delivered to the bridge
  *
+ * @name: name of the channel
  * @transport_stream_id: a number to identify the TS, chosen at will.
  * @service: A _single_ service. Will be concatenated into the SDT.
  * @program_num: The link between PAT, PMT and SDT.
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index ab84044f33ba..2b8404661348 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -20,6 +20,9 @@
  * modulation and fec_inner
  * @modulation: see enum fe_modulation
  * @fec: see enum fe_fec_rate
+ * @cnr_ok: S/N threshold to consider the signal as OK. Below that, there's
+ *          a chance of losing sync.
+ * @cnr_good: S/N threshold to consider the signal strong.
  *
  * This struct matches values for 'good' and 'ok' CNRs given the combination
  * of modulation and fec_inner in use. We might simulate some noise if the
@@ -53,13 +56,8 @@ struct vidtv_demod_config {
  * struct vidtv_demod_state - The demodulator state
  * @frontend: The frontend structure allocated by the demod.
  * @config: The config used to init the demod.
- * @poll_snr: The task responsible for periodically checking the simulated
- * signal quality, eventually dropping or reacquiring the TS lock.
  * @status: the demod status.
- * @cold_start: Whether the demod has not been init yet.
- * @poll_snr_thread_running: Whether the task responsible for periodically
- * checking the simulated signal quality is running.
- * @poll_snr_thread_restart: Whether we should restart the poll_snr task.
+ * @tuner_cnr: current S/N ratio for the signal carrier
  */
 struct vidtv_demod_state {
 	struct dvb_frontend frontend;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index 0ac5b1e3f666..50e3cf4eb4eb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -103,14 +103,16 @@ enum musical_notes {
  * @encoder_buf_sz: The encoder buffer size, in bytes
  * @encoder_buf_offset: Our byte position in the encoder buffer.
  * @sample_count: How many samples we have encoded in total.
+ * @access_units: encoder payload units, used for clock references
  * @src_buf: The source of raw data to be encoded, encoder might set a
  * default if null.
+ * @src_buf_sz: size of @src_buf.
  * @src_buf_offset: Our position in the source buffer.
  * @is_video_encoder: Whether this a video encoder (as opposed to audio)
  * @ctx: Encoder-specific state.
  * @stream_id: Examples: Audio streams (0xc0-0xdf), Video streams
  * (0xe0-0xef).
- * @es_id: The TS PID to use for the elementary stream in this encoder.
+ * @es_pid: The TS PID to use for the elementary stream in this encoder.
  * @encode: Prepare enough AUs for the given amount of time.
  * @clear: Clear the encoder output.
  * @sync: Attempt to synchronize with this encoder.
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index e186094c4fb7..ad82eb72b841 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -59,6 +59,7 @@ struct vidtv_mux_timing {
  * @pat: The PAT in use by the muxer.
  * @pmt_secs: The PMT sections in use by the muxer. One for each program in the PAT.
  * @sdt: The SDT in use by the muxer.
+ * @nit: The NIT in use by the muxer.
  * @eit: the EIT in use by the muxer.
  */
 struct vidtv_mux_si {
@@ -86,8 +87,10 @@ struct vidtv_mux_pid_ctx {
 
 /**
  * struct vidtv_mux - A muxer abstraction loosely based in libavcodec/mpegtsenc.c
- * @mux_rate_kbytes_sec: The bit rate for the TS, in kbytes.
+ * @fe: The frontend structure allocated by the muxer.
+ * @dev: pointer to struct device.
  * @timing: Keeps track of timing related information.
+ * @mux_rate_kbytes_sec: The bit rate for the TS, in kbytes.
  * @pid_ctx: A hash table to keep track of per-PID metadata.
  * @on_new_packets_available_cb: A callback to inform of new TS packets ready.
  * @mux_buf: A pointer to a buffer for this muxer. TS packets are stored there
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
index 99f45056adc2..963c59155e72 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -113,8 +113,10 @@ struct pes_header_write_args {
  * @dest_buf_sz: The size of the dest_buffer
  * @pid: The PID to use for the TS packets.
  * @continuity_counter: Incremented on every new TS packet.
- * @n_pes_h_s_bytes: Padding bytes. Might be used by an encoder if needed, gets
+ * @wrote_pes_header: Flag to indicate that the PES header was written
+ * @n_stuffing_bytes: Padding bytes. Might be used by an encoder if needed, gets
  * discarded by the decoder.
+ * @pcr: counter driven by a 27Mhz clock.
  */
 struct pes_ts_header_write_args {
 	void *dest_buf;
@@ -145,6 +147,7 @@ struct pes_ts_header_write_args {
  * @dts: DTS value to send.
  * @n_pes_h_s_bytes: Padding bytes. Might be used by an encoder if needed, gets
  * discarded by the decoder.
+ * @pcr: counter driven by a 27Mhz clock.
  */
 struct pes_write_args {
 	void *dest_buf;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 6efc27996395..3103e7ba5cb3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -43,7 +43,7 @@ enum vidtv_psi_stream_types {
 	STREAM_PRIVATE_DATA = 0x06, /* see ISO/IEC 13818-1 2000 p. 48 */
 };
 
-/**
+/*
  * struct vidtv_psi_desc - A generic PSI descriptor type.
  * The descriptor length is an 8-bit field specifying the total number of bytes of the data portion
  * of the descriptor following the byte defining the value of this field.
@@ -55,7 +55,7 @@ struct vidtv_psi_desc {
 	u8 data[];
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_desc_service - Service descriptor.
  * See ETSI EN 300 468 section 6.2.33.
  */
@@ -71,7 +71,7 @@ struct vidtv_psi_desc_service {
 	char *service_name;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_desc_registration - A registration descriptor.
  * See ISO/IEC 13818-1 section 2.6.8
  */
@@ -93,7 +93,7 @@ struct vidtv_psi_desc_registration {
 	u8 additional_identification_info[];
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_desc_network_name - A network name descriptor
  * see ETSI EN 300 468 v1.15.1 section 6.2.27
  */
@@ -110,7 +110,7 @@ struct vidtv_psi_desc_service_list_entry {
 	struct vidtv_psi_desc_service_list_entry *next;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_desc_service_list - A service list descriptor
  * see ETSI EN 300 468 v1.15.1 section 6.2.35
  */
@@ -121,7 +121,7 @@ struct vidtv_psi_desc_service_list {
 	struct vidtv_psi_desc_service_list_entry *service_list;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_desc_short_event - A short event descriptor
  * see ETSI EN 300 468 v1.15.1 section 6.2.37
  */
@@ -142,7 +142,7 @@ struct vidtv_psi_desc_short_event
 				 char *event_name,
 				 char *text);
 
-/**
+/*
  * struct vidtv_psi_table_header - A header that is present for all PSI tables.
  */
 struct vidtv_psi_table_header {
@@ -158,7 +158,7 @@ struct vidtv_psi_table_header {
 	u8  last_section; /* last_section_number */
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_table_pat_program - A single program in the PAT
  * See ISO/IEC 13818-1 : 2000 p.43
  */
@@ -168,7 +168,7 @@ struct vidtv_psi_table_pat_program {
 	struct vidtv_psi_table_pat_program *next;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_table_pat - The Program Allocation Table (PAT)
  * See ISO/IEC 13818-1 : 2000 p.43
  */
@@ -179,7 +179,7 @@ struct vidtv_psi_table_pat {
 	struct vidtv_psi_table_pat_program *program;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_table_sdt_service - Represents a service in the SDT.
  * see ETSI EN 300 468 v1.15.1 section 5.2.3.
  */
@@ -193,7 +193,7 @@ struct vidtv_psi_table_sdt_service {
 	struct vidtv_psi_table_sdt_service *next;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_table_sdt - Represents the Service Description Table
  * see ETSI EN 300 468 v1.15.1 section 5.2.3.
  */
@@ -205,7 +205,7 @@ struct vidtv_psi_table_sdt {
 	struct vidtv_psi_table_sdt_service *service;
 } __packed;
 
-/**
+/*
  * enum service_running_status - Status of a SDT service.
  * see ETSI EN 300 468 v1.15.1 section 5.2.3 table 6.
  */
@@ -213,7 +213,7 @@ enum service_running_status {
 	RUNNING = 0x4,
 };
 
-/**
+/*
  * enum service_type - The type of a SDT service.
  * see ETSI EN 300 468 v1.15.1 section 6.2.33, table 81.
  */
@@ -223,7 +223,7 @@ enum service_type {
 	DIGITAL_RADIO_SOUND_SERVICE = 0X2,
 };
 
-/**
+/*
  * struct vidtv_psi_table_pmt_stream - A single stream in the PMT.
  * See ISO/IEC 13818-1 : 2000 p.46.
  */
@@ -235,7 +235,7 @@ struct vidtv_psi_table_pmt_stream {
 	struct vidtv_psi_table_pmt_stream *next;
 } __packed;
 
-/**
+/*
  * struct vidtv_psi_table_pmt - The Program Map Table (PMT).
  * See ISO/IEC 13818-1 : 2000 p.46.
  */
@@ -477,7 +477,6 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc);
  * vidtv_psi_create_sec_for_each_pat_entry - Create a PMT section for each
  * program found in the PAT
  * @pat: The PAT to look for programs.
- * @s: The stream loop (one or more streams)
  * @pcr_pid: packet ID for the PCR to be used for the program described in this
  * PMT section
  */
@@ -595,9 +594,11 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args *args);
  * @buf: The destination buffer.
  * @offset: The offset into the destination buffer.
  * @pmt: A pointer to the PMT.
+ * @pid: Program ID
  * @buf_sz: The size of the destination buffer.
  * @continuity_counter: A pointer to the CC. Incremented on every new packet.
- *
+ * @pcr_pid: The TS PID used for the PSI packets. All channels will share the
+ * same PCR.
  */
 struct vidtv_psi_pmt_write_args {
 	char *buf;
@@ -714,7 +715,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args *args);
 
 void vidtv_psi_nit_table_destroy(struct vidtv_psi_table_nit *nit);
 
-/**
+/*
  * struct vidtv_psi_desc_short_event - A short event descriptor
  * see ETSI EN 300 468 v1.15.1 section 6.2.37
  */
@@ -750,7 +751,7 @@ struct vidtv_psi_table_eit
  * struct vidtv_psi_eit_write_args - Arguments for writing an EIT section
  * @buf: The destination buffer.
  * @offset: The offset into the destination buffer.
- * @nit: A pointer to the NIT
+ * @eit: A pointer to the EIT
  * @buf_sz: The size of the destination buffer.
  * @continuity_counter: A pointer to the CC. Incremented on every new packet.
  *
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index e990b755bb20..9cc94e4a8924 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -33,6 +33,9 @@
  * @enc: A pointer to the containing encoder structure.
  * @frame_index: The current frame in a block
  * @au_count: The total number of access units encoded up to now
+ * @last_duration: Duration of the tone currently being played
+ * @note_offset: Position at the music tone array
+ * @last_tone: Tone currently being played
  */
 struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
@@ -43,7 +46,7 @@ struct vidtv_s302m_ctx {
 	enum musical_notes last_tone;
 };
 
-/**
+/*
  * struct vidtv_smpte_s302m_es - s302m MPEG Elementary Stream header.
  *
  * See SMPTE 302M 2007 table 1.
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index 6b989a2c1433..10838a2b8389 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -53,7 +53,7 @@ struct vidtv_mpeg_ts {
  * @dest_offset: The byte offset into the buffer.
  * @pid: The TS PID for the PCR packets.
  * @buf_sz: The size of the buffer in bytes.
- * @countinuity_counter: The TS continuity_counter.
+ * @continuity_counter: The TS continuity_counter.
  * @pcr: A sample from the system clock.
  */
 struct pcr_write_args {
@@ -70,7 +70,7 @@ struct pcr_write_args {
  * @dest_buf: The buffer to write into.
  * @dest_offset: The byte offset into the buffer.
  * @buf_sz: The size of the buffer in bytes.
- * @countinuity_counter: The TS continuity_counter.
+ * @continuity_counter: The TS continuity_counter.
  */
 struct null_packet_write_args {
 	void *dest_buf;
-- 
2.28.0

