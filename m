Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0F81A019A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDFXVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:32 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34329 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFXVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:32 -0400
Received: by mail-qt1-f196.google.com with SMTP id 14so1357989qtp.1;
        Mon, 06 Apr 2020 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PpbyX1WuBtdSzHfRR+tKl8K9IZRMVMgL6KyqM10pbN8=;
        b=rCggRTnN02uDxBY/f9OOz1UmYTUdtTGvMKs966ayc8CPoBJglKnIh9QLniFs2CSktG
         uMqZOYZeOTbQySfYWKtFq3ckjJaYA3+sPV+YAmPy5dmIC76Z41zMCt+kIu6g98Jp6coS
         Tp1lo4C2n4UblcR63/ghKnjgpuKp/sCQiWDGSuBP9/rEHu+gChLXx54qzLWAo66UzyRa
         LrRPnckvvkDsJYKvMB6PpgxmVQDMSNoosSLYR2cCrm+bYXMmqxQp8L4JGcs2nBbtNTG2
         zpFyUXziEaCfsoGAYMtS7wjmywY0mZL1/YaFlNdJQ3Dyrqfrzrhf56umIv4CgNSqkJHP
         vmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PpbyX1WuBtdSzHfRR+tKl8K9IZRMVMgL6KyqM10pbN8=;
        b=ZPI8uY9s64pHKBtH6i5gBYvLhBuSK/Rrhy+FMARMsTBCew+lFF4oq/NaKccS5XN4er
         4MmtHj1ajLFeS9jwDlW7FmBSNxh/aQXl48nJsj8wbKwMXlUb9rt1ivZxMGO6fKxjBKfM
         lqSRRnDR7Rpg6Y/k8N23nMG7IYuPH7fc+yA9PMJo8dtVUJiFMu/kHTNcALR26kic0TA3
         IHExaqoIngWHhHmTagpFMjVa15fkWbkI+RXhr45yrJO3AByjPBemE5UZRfnlfwpGhDUR
         hI+hhVj6HUxV0XKHGr2U8Vl4z0ueiDawsSbquOMi/kg1ISIWA7Q919KfQmuspAI+rvqw
         7vBQ==
X-Gm-Message-State: AGi0PuZpEiaiZDfCFufi48QPH/8jnkIYyMfw0pOuXkR1jU832PwsTxxt
        SiFcttWAfNO50LdQCM6orTs=
X-Google-Smtp-Source: APiQypLIeVLaERRDCmncNcmvxqYrnc5srewvRoL1cBlZEdkHzct66DcySE6mJJU4ey3rZPBlQcOcGA==
X-Received: by 2002:ac8:6d0b:: with SMTP id o11mr1989482qtt.324.1586215290328;
        Mon, 06 Apr 2020 16:21:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:29 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 6/6] media: vidtv: add a bridge driver
Date:   Mon,  6 Apr 2020 20:20:55 -0300
Message-Id: <20200406232055.1023946-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Digital TV devices consist of several independent hardware components which
are controlled by different drivers.
Each media device is controlled by a group of cooperating drivers with the
bridge driver as the main driver.

This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].

The bridge driver binds to the other drivers, that is, vidtv_tuner and
vidtv_demod and implements the digital demux logic, providing userspace
with a MPEG Transport Stream.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test_drivers/vidtv/Makefile     |   3 +-
 .../media/test_drivers/vidtv/vidtv_bridge.c   | 736 ++++++++++++++++++
 .../media/test_drivers/vidtv/vidtv_bridge.h   |  51 ++
 .../media/test_drivers/vidtv/vidtv_common.h   |  15 +
 4 files changed, 804 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.h

diff --git a/drivers/media/test_drivers/vidtv/Makefile b/drivers/media/test_drivers/vidtv/Makefile
index 690420a7c904b..296e591883c5e 100644
--- a/drivers/media/test_drivers/vidtv/Makefile
+++ b/drivers/media/test_drivers/vidtv/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vidtv_demod-objs := vidtv_common.o vidtv_psi.o
+vidtv_bridge-objs := vidtv_common.o vidtv_psi.o
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o
+obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test_drivers/vidtv/vidtv_bridge.c b/drivers/media/test_drivers/vidtv/vidtv_bridge.c
new file mode 100644
index 0000000000000..a3dfd913d1e83
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_bridge.c
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/time.h>
+#include "vidtv_bridge.h"
+#include "vidtv_common.h"
+#include "vidtv_psi.h"
+
+#define TS_BUF_MAX_SZ (128 * TS_PACKET_LEN)
+
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
+
+static unsigned int drop_tslock_prob_on_low_snr;
+module_param(drop_tslock_prob_on_low_snr, uint, 0644);
+MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
+		 "Probability of losing the TS lock if the signal quality is bad");
+
+static unsigned int recover_tslock_prob_on_good_snr;
+module_param(recover_tslock_prob_on_good_snr, uint, 0644);
+MODULE_PARM_DESC(recover_tslock_prob_on_good_snr,
+		 "Probability recovering the TS lock when the signal improves");
+
+static unsigned int mock_power_up_delay_msec;
+module_param(mock_power_up_delay_msec, uint, 0644);
+MODULE_PARM_DESC(mock_power_up_delay_msec, "Simulate a power up delay");
+
+static unsigned int mock_tune_delay_msec;
+module_param(mock_tune_delay_msec, uint, 0644);
+MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");
+
+static unsigned int vidtv_valid_dvb_t_freqs[8];
+module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0644);
+MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
+		 "Valid DVB-T frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_c_freqs[8];
+module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0644);
+MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
+		 "Valid DVB-C frequencies to simulate");
+
+static unsigned int vidtv_valid_dvb_s_freqs[8];
+module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0644);
+MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
+		 "Valid DVB-C frequencies to simulate");
+
+static unsigned int max_frequency_shift_hz;
+module_param(max_frequency_shift_hz, uint, 0644);
+MODULE_PARM_DESC(max_frequency_shift_hz,
+		 "Maximum shift in HZ allowed when tuning in a channel");
+
+static unsigned int chosen_delsys = SYS_DVBT;
+module_param(chosen_delsys, uint, 0644);
+MODULE_PARM_DESC(chosen_delsys,
+		 "The delivery system to simulate. Currently supported: DVB-T, DVB-C, DVB-S");
+
+static unsigned int ts_buf_sz = 20 * TS_PACKET_LEN;
+module_param(ts_buf_sz, uint, 0644);
+MODULE_PARM_DESC(ts_buf_sz, "Optional size for the TS buffer");
+
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nums);
+
+/*
+ * Influences the signal acquisition time. See ISO/IEC 13818-1 : 2000. p. 113.
+ */
+static unsigned int psi_freq_hz = 25;
+module_param(psi_freq_hz, uint, 0644);
+MODULE_PARM_DESC(psi_freq_hz, "Simulate a given PSI frequency");
+
+static unsigned int mpeg_thread_freq_hz = 100;
+module_param(mpeg_thread_freq_hz, uint, 0644);
+MODULE_PARM_DESC(mpeg_thread_freq_hz,
+		 "Simulate a given loop frequency for the MPEG thread");
+
+static int vidtv_start_streaming(struct vidtv_dvb *dvb)
+{
+	/* if already streaming, then this call is probably a mistake */
+	WARN_ON(dvb->streaming);
+
+	dvb->streaming = true;
+	schedule_work(&dvb->mpeg_thread);
+
+	return 0;
+}
+
+static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
+{
+	/* mpeg thread will quit */
+	dvb->streaming = false;
+
+	return 0;
+}
+
+static int vidtv_start_feed(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux  = feed->demux;
+	struct vidtv_dvb *dvb = demux->priv;
+	int rc, ret;
+
+	if (!demux->dmx.frontend)
+		return -EINVAL;
+
+	mutex_lock(&dvb->feed_lock);
+
+	dvb->nfeeds++;
+	rc = dvb->nfeeds;
+
+	if (dvb->nfeeds == 1) {
+		ret = vidtv_start_streaming(dvb);
+		if (ret < 0)
+			rc = ret;
+	}
+
+	mutex_unlock(&dvb->feed_lock);
+	return rc;
+}
+
+static int vidtv_stop_feed(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux  = feed->demux;
+	struct vidtv_dvb *dvb = demux->priv;
+	int err = 0;
+
+	mutex_lock(&dvb->feed_lock);
+	dvb->nfeeds--;
+
+	if (!dvb->nfeeds)
+		err = vidtv_stop_streaming(dvb);
+
+	mutex_unlock(&dvb->feed_lock);
+	return err;
+}
+
+static void vidtv_bridge_channels_init(struct vidtv_dvb *dvb)
+{
+	/* these channels will be used to populate the MPEG PSI tables */
+
+	const u16 pac_service_id = 0x880;
+	const u16 pac_program_num = 0x880;
+	const u16 pac_program_pid = 0x101; /* packet id for PMT*/
+	const u16 pac_audio_stream_id = 0x111;
+
+	struct vidtv_channel pac; /* PCM Audio Channel */
+	struct vidtv_psi_table_sdt_service *pac_service;
+	struct vidtv_psi_desc_service *pac_s_desc;
+	u16 desc_length;
+
+	pac_service = vidtv_psi_sdt_service_init(NULL, pac_service_id);
+
+	pac_s_desc = (struct vidtv_psi_desc_service *)
+		     vidtv_psi_desc_init(NULL,
+					 SERVICE_DESCRIPTOR,
+					 sizeof(*pac_s_desc));
+
+	pac_s_desc->name = "Sine Wave PCM Audio";
+	pac_s_desc->service_type = DIGITAL_TELEVISION_SERVICE;
+
+	pac_s_desc->length = sizeof(pac_s_desc->service_type)
+			     + strlen(pac_s_desc->name)
+			     + strlen(pac_s_desc->name_emph)
+			     + strlen(pac_s_desc->provider)
+			     + strlen(pac_s_desc->provider_emph);
+
+	vidtv_psi_desc_assign(&pac_service->descriptor,
+			      (struct vidtv_psi_desc *)
+			      pac_s_desc,
+			      &desc_length);
+
+	pac_service->desc_length = desc_length;
+
+	pac.transport_stream_id = TRANSPORT_STREAM_ID;
+
+	pac.program = vidtv_psi_pat_program_init(NULL,
+						 pac_service_id,
+						 pac_program_pid);
+
+	pac.program_num = pac_program_num;
+	pac.streams = vidtv_psi_pmt_stream_init(NULL,
+						ISO_IEC_13818_3_AUDIO,
+						pac_audio_stream_id);
+
+	dvb->channels[0] = pac;
+}
+
+static void
+vidtv_bridge_channels_destroy(struct vidtv_dvb *dvb)
+{
+	u32 i;
+	struct vidtv_channel *curr;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = &dvb->channels[i];
+		vidtv_psi_sdt_service_destroy(curr->service);
+		vidtv_psi_pat_program_destroy(curr->program);
+		vidtv_psi_pmt_stream_destroy(curr->streams);
+	}
+}
+
+static struct vidtv_psi_table_sdt_service*
+vidtv_bridge_sdt_serv_cat_into_new(struct vidtv_channel chnls[NUM_CHANNELS])
+{
+	u32 i;
+	struct vidtv_psi_table_sdt_service *curr = NULL;
+	struct vidtv_psi_table_sdt_service *head = NULL;
+	struct vidtv_psi_table_sdt_service *tail = NULL;
+	u16 service_id;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = chnls[i].service;
+		service_id = curr->service_id;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = vidtv_psi_sdt_service_init(tail, service_id);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+static struct vidtv_psi_table_pat_program*
+vidtv_bridge_pat_prog_cat_into_new(struct vidtv_channel chnls[NUM_CHANNELS])
+{
+	u32 i;
+	struct vidtv_psi_table_pat_program *curr = NULL;
+	struct vidtv_psi_table_pat_program *head = NULL;
+	struct vidtv_psi_table_pat_program *tail = NULL;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		curr = chnls[i].program;
+
+		if (!curr)
+			continue;
+
+		while (curr->next) {
+			tail = vidtv_psi_pat_program_init(tail,
+							  curr->service_id,
+							  curr->pid);
+
+			if (!head)
+				head = tail;
+
+			curr = curr->next;
+		}
+	}
+
+	return head;
+}
+
+static void
+vidtv_bridge_pmt_match_sections(struct vidtv_channel chnls[NUM_CHANNELS],
+				struct vidtv_psi_table_pmt *sections,
+				u32 nsections)
+{
+	struct vidtv_psi_table_pmt *curr_section = NULL;
+	u32 i, j;
+
+	for (i = 0; i < NUM_CHANNELS; ++i) {
+		for (j = 0; j < nsections; ++j) {
+			curr_section = &sections[j];
+
+			if (!curr_section)
+				continue;
+
+			/* we got a match */
+			if (curr_section->header.id ==
+			    chnls[i].program_num) {
+				vidtv_psi_pmt_stream_assign(curr_section,
+							    chnls[i].streams);
+				break;
+			}
+		}
+	}
+}
+
+static void vidtv_bridge_mpeg_tables_init(struct vidtv_dvb *dvb)
+{
+	struct vidtv_psi_table_pat *pat = dvb->pat;
+	struct vidtv_psi_table_sdt *sdt = dvb->sdt;
+
+	struct vidtv_psi_table_pmt *pmt_sections = dvb->pmt_sections;
+
+	struct vidtv_psi_table_pat_program *programs = NULL;
+	struct vidtv_psi_table_sdt_service *services = NULL;
+
+	bool update_version_num = false;
+
+	vidtv_psi_pat_table_init(pat,
+				 update_version_num,
+				 TRANSPORT_STREAM_ID);
+
+	vidtv_psi_sdt_table_init(sdt,
+				 update_version_num,
+				 TRANSPORT_STREAM_ID);
+
+	programs = vidtv_bridge_pat_prog_cat_into_new(dvb->channels);
+	services = vidtv_bridge_sdt_serv_cat_into_new(dvb->channels);
+
+	/* assemble all programs and assign to PAT */
+	vidtv_psi_pat_program_assign(pat, programs);
+
+	/* assemble all services and assign to SDT */
+	vidtv_psi_sdt_service_assign(sdt, services);
+
+	/* a section for each program_id */
+	pmt_sections = kcalloc(pat->programs,
+			       sizeof(struct vidtv_psi_table_pmt),
+			       GFP_KERNEL);
+
+	vidtv_psi_pmt_create_sec_for_each_pat_entry(pat,
+						    pmt_sections);
+
+	vidtv_bridge_pmt_match_sections(dvb->channels,
+					pmt_sections,
+					pat->programs);
+}
+
+static void vidtv_bridge_mpeg_tables_destroy(struct vidtv_dvb *dvb)
+{
+	u32 i;
+
+	vidtv_psi_pat_table_destroy(dvb->pat);
+
+	for (i = 0; i < dvb->num_pmt_sections; ++i)
+		vidtv_psi_pmt_table_destroy(&dvb->pmt_sections[i]);
+
+	vidtv_psi_sdt_table_destroy(dvb->sdt);
+}
+
+static bool vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
+{
+	enum fe_status status;
+
+	dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
+
+	return status == FE_HAS_LOCK; /* all other flags will be set */
+}
+
+static bool vidtv_bridge_should_push_psi(struct vidtv_dvb *dvb,
+					 unsigned long elapsed_time)
+{
+	unsigned long psi_period_in_jiffies;
+	unsigned long next_psi_at;
+
+	psi_period_in_jiffies = usecs_to_jiffies(USECS_IN_SEC / psi_freq_hz);
+	next_psi_at = dvb->stream_start_jiffies +
+		      (dvb->num_streamed_psi * psi_period_in_jiffies);
+
+	/* if this is in the past, it is time to push PSI packets again */
+	return elapsed_time > next_psi_at;
+}
+
+static void vidtv_bridge_mpeg_push_psi(struct vidtv_dvb *dvb,
+				       u8 *buf,
+				       u32 *buffer_offset)
+{
+	u16 pmt_pid;
+	u32 i;
+
+	*buffer_offset += vidtv_psi_pat_write_into(buf,
+						   *buffer_offset,
+						   dvb->pat,
+						   dvb->ts_buffer_sz);
+
+	for (i = 0; i < dvb->num_pmt_sections; ++i) {
+		pmt_pid = vidtv_psi_pmt_get_pid(&dvb->pmt_sections[i],
+						dvb->pat);
+
+		/* not found */
+		WARN_ON(pmt_pid > LAST_VALID_TS_PID);
+
+		/* write each section into buffer */
+		*buffer_offset +=
+			vidtv_psi_pmt_write_into(buf,
+						 *buffer_offset,
+						 &dvb->pmt_sections[i],
+						 pmt_pid,
+						 dvb->ts_buffer_sz);
+	}
+
+	*buffer_offset += vidtv_psi_sdt_write_into(buf,
+						   *buffer_offset,
+						   dvb->sdt,
+						   dvb->ts_buffer_sz);
+
+	dvb->num_streamed_psi++;
+}
+
+static void vidtv_bridge_mpeg_tick(struct work_struct *work)
+{
+	struct vidtv_dvb *dvb = container_of(work,
+					     struct vidtv_dvb,
+					     mpeg_thread);
+
+	const int SLEEP_USECS = USECS_IN_SEC / mpeg_thread_freq_hz;
+	char *buf = dvb->ts_buffer;
+	u32 buffer_offset;
+	unsigned long elapsed_time = 0;
+
+	dvb->stream_start_jiffies = jiffies;
+
+	while (dvb->streaming && vidtv_bridge_check_demod_lock(dvb, 0)) {
+		memset(buf, 0, dvb->ts_buffer_sz);
+		buffer_offset = 0;
+
+		if (vidtv_bridge_should_push_psi(dvb, elapsed_time))
+			vidtv_bridge_mpeg_push_psi(dvb, buf, &buffer_offset);
+
+		/*
+		 * just a sanity check, should not happen because we check
+		 * for overflow before writing
+		 */
+		WARN_ON(buffer_offset > dvb->ts_buffer_sz);
+
+		/* if packets are not aligned by now, something is also wrong */
+		WARN_ON(buffer_offset % TS_PACKET_LEN);
+
+		dvb_dmx_swfilter_packets(&dvb->demux,
+					 buf,
+					 buffer_offset / TS_PACKET_LEN);
+
+		usleep_range(SLEEP_USECS, SLEEP_USECS + (SLEEP_USECS / 10));
+		elapsed_time = dvb->stream_start_jiffies - jiffies;
+	}
+
+	dvb->streaming = false; /* demod lost the lock */
+	dvb->stream_start_jiffies = 0;
+	dvb->num_streamed_psi = 0;
+}
+
+static int vidtv_master_xfer(struct i2c_adapter *i2c_adap,
+			     struct i2c_msg msgs[],
+			     int num)
+{
+	return 0;
+}
+
+static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C;
+}
+
+struct i2c_algorithm vidtv_i2c_algorithm = {
+	.master_xfer = vidtv_master_xfer,
+	.functionality = vidtv_i2c_func,
+};
+
+static int vidtv_bridge_i2c_register_adap(struct vidtv_dvb *dvb)
+{
+	struct i2c_adapter *i2c_adapter = dvb->i2c_adapter;
+
+	strscpy(i2c_adapter->name, "vidtv_i2c", sizeof(i2c_adapter->name));
+	i2c_adapter->owner	= THIS_MODULE;
+	i2c_adapter->algo	= &vidtv_i2c_algorithm;
+	i2c_adapter->algo_data	= NULL;
+	i2c_adapter->timeout	= 500;
+	i2c_adapter->retries	= 3;
+	i2c_adapter->dev.parent	= NULL;
+
+	i2c_set_adapdata(i2c_adapter, dvb);
+	return i2c_add_adapter(dvb->i2c_adapter);
+}
+
+static int vidtv_bridge_register_adap(struct vidtv_dvb *dvb)
+{
+	int ret = 0;
+
+	ret = dvb_register_adapter(&dvb->adapter,
+				   KBUILD_MODNAME,
+				   THIS_MODULE,
+				   &dvb->i2c_adapter->dev,
+				   adapter_nums);
+
+	return ret;
+}
+
+static int vidtv_bridge_dmx_init(struct vidtv_dvb *dvb)
+{
+	dvb->demux.dmx.capabilities = DMX_TS_FILTERING |
+				      DMX_SECTION_FILTERING;
+
+	dvb->demux.priv       = dvb;
+	dvb->demux.filternum  = 256;
+	dvb->demux.feednum    = 256;
+	dvb->demux.start_feed = vidtv_start_feed;
+	dvb->demux.stop_feed = vidtv_stop_feed;
+
+	return dvb_dmx_init(&dvb->demux);
+}
+
+static int vidtv_bridge_dmxdev_init(struct vidtv_dvb *dvb)
+{
+	dvb->dmx_dev.filternum    = 256;
+	dvb->dmx_dev.demux        = &dvb->demux.dmx;
+	dvb->dmx_dev.capabilities = 0;
+
+	return dvb_dmxdev_init(&dvb->dmx_dev, &dvb->adapter);
+}
+
+static void vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_demod_config cfg = {0};
+
+	cfg.drop_tslock_prob_on_low_snr = drop_tslock_prob_on_low_snr;
+	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
+	cfg.chosen_delsys = chosen_delsys;
+
+	dvb->i2c_client_demod[n] = dvb_module_probe("vidtv_demod",
+						    NULL,
+						    dvb->i2c_adapter,
+						    DEMOD_DEFAULT_ADDR,
+						    &cfg);
+
+	/* retrieve a pointer to struct dvb_frontend */
+	dvb->fe[n] = cfg.frontend;
+}
+
+static void vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
+{
+	struct vidtv_tuner_config cfg = {0};
+
+	cfg.fe = dvb->fe[n];
+	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
+	cfg.mock_tune_delay_msec = mock_tune_delay_msec;
+
+	memcpy(cfg.vidtv_valid_dvb_t_freqs,
+	       vidtv_valid_dvb_t_freqs,
+	       sizeof(vidtv_valid_dvb_t_freqs));
+
+	memcpy(cfg.vidtv_valid_dvb_c_freqs,
+	       vidtv_valid_dvb_c_freqs,
+	       sizeof(vidtv_valid_dvb_c_freqs));
+
+	memcpy(cfg.vidtv_valid_dvb_s_freqs,
+	       vidtv_valid_dvb_s_freqs,
+	       sizeof(vidtv_valid_dvb_s_freqs));
+
+	cfg.max_frequency_shift_hz = max_frequency_shift_hz;
+
+	dvb->i2c_client_tuner[n] = dvb_module_probe("vidtv_tuner",
+						    NULL,
+						    dvb->i2c_adapter,
+						    TUNER_DEFAULT_ADDR,
+						    &cfg);
+}
+
+static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
+{
+	int ret;
+	int i, j;
+
+	ret = vidtv_bridge_i2c_register_adap(dvb);
+	if (ret < 0)
+		goto fail_i2c;
+
+	ret = vidtv_bridge_register_adap(dvb);
+	if (ret < 0)
+		goto fail_adapter;
+
+	vidtv_bridge_probe_demod(dvb, 0);
+	vidtv_bridge_probe_tuner(dvb, 0);
+
+	for (i = 0; i < NUM_FE; ++i) {
+		ret = dvb_register_frontend(&dvb->adapter, dvb->fe[i]);
+		if (ret < 0)
+			goto fail_fe;
+	}
+
+	ret = vidtv_bridge_dmx_init(dvb);
+	if (ret < 0)
+		goto fail_dmx;
+
+	ret = vidtv_bridge_dmxdev_init(dvb);
+	if (ret < 0)
+		goto fail_dmx_dev;
+
+	for (j = 0; j < NUM_FE; ++j) {
+		ret = dvb->demux.dmx.connect_frontend(&dvb->demux.dmx,
+						      &dvb->dmx_fe[j]);
+		if (ret < 0)
+			goto fail_dmx_conn;
+
+		/*
+		 * The source of the demux is a frontend connected
+		 * to the demux.
+		 */
+		dvb->dmx_fe[j].source = DMX_FRONTEND_0;
+	}
+
+	return ret;
+
+fail_dmx_conn:
+	for (j = j - 1; j >= 0; --j)
+		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
+					       &dvb->dmx_fe[j]);
+fail_dmx_dev:
+	dvb_dmxdev_release(&dvb->dmx_dev);
+fail_dmx:
+	dvb_dmx_release(&dvb->demux);
+fail_fe:
+	for (i = i - 1; i >= 0; --i)
+		dvb_unregister_frontend(dvb->fe[i]);
+
+fail_adapter:
+	dvb_unregister_adapter(&dvb->adapter);
+
+fail_i2c:
+	i2c_del_adapter(dvb->i2c_adapter);
+
+	return ret;
+}
+
+static int vidtv_bridge_ts_buffer_init(struct vidtv_dvb *dvb)
+{
+	u32 nbytes_past_boundary;
+
+	if (ts_buf_sz > TS_BUF_MAX_SZ)
+		ts_buf_sz = TS_BUF_MAX_SZ;
+
+	nbytes_past_boundary = ts_buf_sz % TS_PACKET_LEN;
+
+	/* round to the nearest multiple of 188 */
+	if (nbytes_past_boundary)
+		ts_buf_sz += TS_PACKET_LEN - nbytes_past_boundary;
+
+	dvb->ts_buffer = kzalloc(ts_buf_sz, GFP_KERNEL);
+	if (!dvb->ts_buffer)
+		return -ENOMEM;
+
+	dvb->ts_buffer_sz = ts_buf_sz;
+
+	return 0;
+}
+
+static void vidtv_bridge_ts_buffer_destroy(struct vidtv_dvb *dvb)
+{
+	kfree(dvb->ts_buffer);
+	dvb->ts_buffer_sz = 0;
+}
+
+static int vidtv_bridge_i2c_probe(struct i2c_client *client,
+				  const struct i2c_device_id *id)
+{
+	int ret;
+	struct vidtv_dvb *dvb;
+
+	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
+	if (!dvb)
+		return -ENOMEM;
+
+	ret = vidtv_bridge_dvb_init(dvb);
+	if (ret < 0)
+		goto err_dvb;
+
+	ret = vidtv_bridge_ts_buffer_init(dvb);
+	if (ret < 0)
+		goto err_ts_buf;
+
+	vidtv_bridge_channels_init(dvb);
+	vidtv_bridge_mpeg_tables_init(dvb);
+
+	mutex_init(&dvb->feed_lock);
+
+	INIT_WORK(&dvb->mpeg_thread, vidtv_bridge_mpeg_tick);
+	i2c_set_clientdata(client, dvb);
+	return ret;
+
+err_ts_buf:
+err_dvb:
+	kfree(dvb);
+	return ret;
+}
+
+static int vidtv_bridge_i2c_remove(struct i2c_client *client)
+{
+	struct vidtv_dvb *dvb;
+	u32 i;
+
+	dvb = i2c_get_clientdata(client);
+
+	for (i = 0; i < NUM_FE; ++i)
+		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
+					       &dvb->dmx_fe[i]);
+
+	dvb_dmxdev_release(&dvb->dmx_dev);
+	dvb_dmx_release(&dvb->demux);
+
+	for (i = 0; i < NUM_FE; ++i) {
+		dvb_unregister_frontend(dvb->fe[i]);
+		dvb_frontend_detach(dvb->fe[i]);
+	}
+
+	dvb_unregister_adapter(&dvb->adapter);
+
+	vidtv_bridge_mpeg_tables_destroy(dvb);
+	vidtv_bridge_channels_destroy(dvb);
+	vidtv_bridge_ts_buffer_destroy(dvb);
+
+	return 0;
+}
+
+static const struct i2c_device_id vidtv_bridge_id_table[] = {
+	{"vidtv_bridge", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
+
+static struct i2c_driver vidtv_bridge_driver = {
+	.driver = {
+		.name		     = "vidtv_bridge",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= vidtv_bridge_i2c_probe,
+	.remove		= vidtv_bridge_i2c_remove,
+	.id_table	= vidtv_bridge_id_table,
+};
+
+module_i2c_driver(vidtv_bridge_driver);
diff --git a/drivers/media/test_drivers/vidtv/vidtv_bridge.h b/drivers/media/test_drivers/vidtv/vidtv_bridge.h
new file mode 100644
index 0000000000000..4958e5c73e512
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/vidtv_bridge.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_BRIDGE_H
+#define VIDTV_BRIDGE_H
+
+#define NUM_FE 1
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+#include <media/dvb_demux.h>
+#include <media/dmxdev.h>
+#include <linux/i2c.h>
+#include "vidtv_common.h"
+
+struct vidtv_dvb {
+	struct dvb_frontend *fe[NUM_FE];
+	struct dvb_adapter adapter;
+	struct dvb_demux demux;
+	struct dmxdev dmx_dev;
+	struct dmx_frontend dmx_fe[NUM_FE];
+	struct i2c_adapter *i2c_adapter;
+	struct i2c_client *i2c_client_demod[NUM_FE];
+	struct i2c_client *i2c_client_tuner[NUM_FE];
+
+	struct vidtv_psi_table_pat *pat;
+	struct vidtv_psi_table_pmt *pmt_sections;
+	u16 num_pmt_sections; /* as many sections as programs in the PAT */
+	struct vidtv_psi_table_sdt *sdt;
+
+	struct vidtv_channel channels[NUM_CHANNELS];
+
+	u32 nfeeds;
+	struct mutex feed_lock; /* start/stop feed */
+
+	u8 *ts_buffer;
+	u32 ts_buffer_sz;
+
+	struct work_struct mpeg_thread;
+	bool streaming;
+	unsigned long stream_start_jiffies;
+	u64 num_streamed_psi;
+};
+
+#endif // VIDTV_BRIDGE_H
diff --git a/drivers/media/test_drivers/vidtv/vidtv_common.h b/drivers/media/test_drivers/vidtv/vidtv_common.h
index e6b36429cc8de..d2c869cffe35b 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test_drivers/vidtv/vidtv_common.h
@@ -18,6 +18,12 @@
 #define TS_PACKET_LEN 188
 #define TS_PAYLOAD_LEN 184
 #define LAST_VALID_TS_PID 8191
+#define USECS_IN_SEC 1000000
+#define TUNER_DEFAULT_ADDR 0x68
+#define DEMOD_DEFAULT_ADDR 0x60
+#define NUM_CHANNELS 1
+#define TRANSPORT_STREAM_ID 0x744 /* a single stream */
+
 
 /* to be used by both PSI and ES */
 struct vidtv_mpeg_ts_adaption {
@@ -75,6 +81,15 @@ struct vidtv_demod_config {
 	u8 chosen_delsys;
 };
 
+struct vidtv_channel {
+	u16 transport_stream_id;
+	struct vidtv_psi_table_sdt_service *service;
+	u16 program_num;
+	/* a single program with one or more streams associated with it */
+	struct vidtv_psi_table_pat_program *program;
+	struct vidtv_psi_table_pmt_stream *streams;
+};
+
 u32 vidtv_memcpy(void *to,
 		 const void *from,
 		 size_t len,
-- 
2.26.0

