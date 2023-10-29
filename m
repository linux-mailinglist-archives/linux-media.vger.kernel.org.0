Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1EEA7DAC89
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 13:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjJ2MtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 08:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjJ2MtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 08:49:22 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B1DF9
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698583738; x=1699188538; i=wahrenst@gmx.net;
        bh=38s87pSM+eHjO1XG/joTmQMxhQwediVownhNpeypMb8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
         References;
        b=djH+8b3xRKYQVX1rt+7bIJW00kKrGiXoEztzutoGr/QylNhsJ5AsLLKFiQ1oM+nT
         N8GeD5toxehyreSM05kn3fd2f03o7A5InBAj3nsqdvKuUBA08D7lWXnTMEPYbZPqE
         tSr96wtcZqxM4OiY1xj3F/bgORMyozf+ujCKawhnAbUnVQSBDxsyvH/yK2JgYtKDG
         nI7oF25gU7RbiZc2mfhJ2um2qICA0lMhPdVAAM8IJ6g+sukroeIroko8/strkgrGn
         Fb4zebdRKzevOhpJ6tX/DIlWkDHlG/Qf683cvyNFBZBqgqauuwrX7mblumHWSaSdz
         5IikgRAVSHcCVrow0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1rV2fF1aX1-00bJUW; Sun, 29
 Oct 2023 13:48:58 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 3/3] staging: vchiq_arm: move state dump to debugfs
Date:   Sun, 29 Oct 2023 13:48:37 +0100
Message-Id: <20231029124837.119832-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029124837.119832-1-wahrenst@gmx.net>
References: <20231029124837.119832-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6OduE9fvYZNLspe1CIjqeOWFX5MaEQD3ac+q0K27ItBOsWTZw2a
 rUwJSalOfWFT3nINyyDMS4Tq0EDdOp5aQyTMwMpnbizQKNfXrqB/KITyWw1vCZAdFKHCL5+
 03+2rofznoMyeZrBDZOb/bDvlpz108A7W84kLHNTv6tOwRNXgTn3Qs5oofMydACBQ8SlBij
 CG3Zk3Ox6+H2mjDPUr1Eg==
UI-OutboundReport: notjunk:1;M01:P0:mnLuPj/vmYU=;N6Xx3H3JKpepoAnbcFJDYb9pi5V
 7w4HKXP9WDg9QYkqvxYeXGAIy+Wg2Q2XxCRIx1e43kQZh7uAmsLOPBTANRHS1ZGbv71Blpweh
 jE6dDKRL9XnMhb9UjrgNPlQgVMIvRK6LbubT3SJP3hiu/LEGAz5Hln6Jw9yYvUwMIlBDyOTts
 lKbZSUdxJDiv3prFfDK2JFmyfcaco+Urilr8JEFe5tLS3IGT4t1baC80cxhXQLfQhcFW5eQNq
 yvPx5ptkRrS2+OSxy86u6B6sYK5ene8APzOBoRD1cfSUZ3l9CTUDotjE4TK89YIKLw426zLec
 KKpYpjRxNnC50VADAdQc/OxE9N8XLeseQZDmWDFU/EPX9DLKm+Lfq81/f+CMXVhfSnFUcpyRV
 A6j6MEoF0GoCE5Q8r15QtxhgtpGoHTpGza00Ud4Jf/rSaLJB1BoLvpvevJwytFU4Sm1NupE69
 cNmiaj+HVSUiB6nG9ruKBx8K0xMBB6vwSwquGOtKz5H4MXcumTnOpQwIKdHkm6jqaxhVI+M3v
 hNnsS6yrmGdZzJk+fqMUnAXa5FrsBqpoidVKPHigYm65kTEPiD2lIyh8xyiIT4vO+ppmJXL5g
 frZxHCmo/Vl4R/hFwdJ09DawAObkjSPe5Ck9n0R6uw2jiECFE1bIDyiRwHxEOFnbjm2DbQxB9
 vAfarBW7auFvUdsNHwpdVGU3i+76WhcEHDDHQAmfFHwRQ4MaCtxpFFPEr4bqu7H4fyA4Fc/fR
 n3GVSaQGTdQil4arIBtgZhJddCq5J5dw1ChMO80oGpKscOSA0cpndXu7WqlYKnMUkOzWPUrUX
 f859JsfyT6+B8pcrivkozAGU17epD4Dzw0J9ddBj0/obG4DzGI4S05lswvVerIiBeY+KPz9+W
 VR/pVKIeOJWNFFQ/9/4k8QL8CZbpQf3NfMhLCLt1PUKKI8M4VNEYFMluNH5d3vM45vggdVDh/
 JLQ4d8U+sHRTnCIXiKtZXorvcn4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Besides the IOCTL interface the VCHIQ character device also provides
a state dump of the whole VCHIQ driver via read. Moving the state dump
function to debugfs has a lot advantages:

- following changes on state dump doesn't break userspace ABI
- debug doesn't depend on VCHIQ_CDEV
- dump code simplifies a lot and reduce the chance of buffer overflows

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           |  94 ++------
 .../interface/vchiq_arm/vchiq_arm.h           |   7 -
 .../interface/vchiq_arm/vchiq_core.c          | 220 ++++++------------
 .../interface/vchiq_arm/vchiq_core.h          |  13 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |  10 +
 .../interface/vchiq_arm/vchiq_dev.c           |  21 --
 6 files changed, 107 insertions(+), 258 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb8f657cc78..7978fb6dc4fb 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -659,13 +659,9 @@ vchiq_complete_bulk(struct vchiq_instance *instance, =
struct vchiq_bulk *bulk)
 			      bulk->actual);
 }

-int vchiq_dump_platform_state(void *dump_context)
+void vchiq_dump_platform_state(struct seq_file *f)
 {
-	char buf[80];
-	int len;
-
-	len =3D snprintf(buf, sizeof(buf), "  Platform: 2835 (VC master)");
-	return vchiq_dump(dump_context, buf, len + 1);
+	seq_puts(f, "  Platform: 2835 (VC master)\n");
 }

 #define VCHIQ_INIT_RETRIES 10
@@ -1190,56 +1186,13 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
 		bulk_userdata);
 }

-int vchiq_dump(void *dump_context, const char *str, int len)
-{
-	struct dump_context *context =3D (struct dump_context *)dump_context;
-	int copy_bytes;
-
-	if (context->actual >=3D context->space)
-		return 0;
-
-	if (context->offset > 0) {
-		int skip_bytes =3D min_t(int, len, context->offset);
-
-		str +=3D skip_bytes;
-		len -=3D skip_bytes;
-		context->offset -=3D skip_bytes;
-		if (context->offset > 0)
-			return 0;
-	}
-	copy_bytes =3D min_t(int, len, context->space - context->actual);
-	if (copy_bytes =3D=3D 0)
-		return 0;
-	if (copy_to_user(context->buf + context->actual, str,
-			 copy_bytes))
-		return -EFAULT;
-	context->actual +=3D copy_bytes;
-	len -=3D copy_bytes;
-
-	/*
-	 * If the terminating NUL is included in the length, then it
-	 * marks the end of a line and should be replaced with a
-	 * carriage return.
-	 */
-	if ((len =3D=3D 0) && (str[copy_bytes - 1] =3D=3D '\0')) {
-		char cr =3D '\n';
-
-		if (copy_to_user(context->buf + context->actual - 1,
-				 &cr, 1))
-			return -EFAULT;
-	}
-	return 0;
-}
-
-int vchiq_dump_platform_instances(void *dump_context)
+void vchiq_dump_platform_instances(struct seq_file *f)
 {
 	struct vchiq_state *state =3D vchiq_get_state();
-	char buf[80];
-	int len;
 	int i;

 	if (!state)
-		return -ENOTCONN;
+		return;

 	/*
 	 * There is no list of instances, so instead scan all services,
@@ -1264,7 +1217,6 @@ int vchiq_dump_platform_instances(void *dump_context=
)
 	for (i =3D 0; i < state->unused_service; i++) {
 		struct vchiq_service *service;
 		struct vchiq_instance *instance;
-		int err;

 		rcu_read_lock();
 		service =3D rcu_dereference(state->services[i]);
@@ -1280,43 +1232,35 @@ int vchiq_dump_platform_instances(void *dump_conte=
xt)
 		}
 		rcu_read_unlock();

-		len =3D snprintf(buf, sizeof(buf),
-			       "Instance %pK: pid %d,%s completions %d/%d",
-			       instance, instance->pid,
-			       instance->connected ? " connected, " :
-			       "",
-			       instance->completion_insert -
-			       instance->completion_remove,
-			       MAX_COMPLETIONS);
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
+		seq_printf(f, "Instance %pK: pid %d,%s completions %d/%d\n",
+			   instance, instance->pid,
+			   instance->connected ? " connected, " :
+			   "",
+			   instance->completion_insert -
+			   instance->completion_remove,
+			   MAX_COMPLETIONS);
 		instance->mark =3D 1;
 	}
-	return 0;
 }

-int vchiq_dump_platform_service_state(void *dump_context,
-				      struct vchiq_service *service)
+void vchiq_dump_platform_service_state(struct seq_file *f,
+				       struct vchiq_service *service)
 {
 	struct user_service *user_service =3D
 			(struct user_service *)service->base.userdata;
-	char buf[80];
-	int len;

-	len =3D scnprintf(buf, sizeof(buf), "  instance %pK", service->instance)=
;
+	seq_printf(f, "  instance %pK", service->instance);

 	if ((service->base.callback =3D=3D service_callback) && user_service->is=
_vchi) {
-		len +=3D scnprintf(buf + len, sizeof(buf) - len, ", %d/%d messages",
-				 user_service->msg_insert - user_service->msg_remove,
-				 MSG_QUEUE_SIZE);
+		seq_printf(f, ", %d/%d messages",
+			   user_service->msg_insert - user_service->msg_remove,
+			   MSG_QUEUE_SIZE);

 		if (user_service->dequeue_pending)
-			len +=3D scnprintf(buf + len, sizeof(buf) - len,
-				" (dequeue pending)");
+			seq_puts(f, " (dequeue pending)");
 	}

-	return vchiq_dump(dump_context, buf, len + 1);
+	seq_puts(f, "\n");
 }

 struct vchiq_state *
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 7cdc3d70bd2c..7844ef765a00 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -69,13 +69,6 @@ struct vchiq_instance {
 	struct vchiq_debugfs_node debugfs_node;
 };

-struct dump_context {
-	char __user *buf;
-	size_t actual;
-	size_t space;
-	loff_t offset;
-};
-
 extern spinlock_t msg_queue_spinlock;
 extern struct vchiq_state g_state;

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 36c742a2f3b2..6ca83f79622e 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3372,8 +3372,8 @@ vchiq_set_service_option(struct vchiq_instance *inst=
ance, unsigned int handle,
 	return ret;
 }

-static int
-vchiq_dump_shared_state(void *dump_context, struct vchiq_state *state,
+static void
+vchiq_dump_shared_state(struct seq_file *f, struct vchiq_state *state,
 			struct vchiq_shared_state *shared, const char *label)
 {
 	static const char *const debug_names[] =3D {
@@ -3390,57 +3390,37 @@ vchiq_dump_shared_state(void *dump_context, struct=
 vchiq_state *state,
 		"COMPLETION_QUEUE_FULL_COUNT"
 	};
 	int i;
-	char buf[80];
-	int len;
-	int err;
-
-	len =3D scnprintf(buf, sizeof(buf), "  %s: slots %d-%d tx_pos=3D%x recyc=
le=3D%x",
-			label, shared->slot_first, shared->slot_last,
-			shared->tx_pos, shared->slot_queue_recycle);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	len =3D scnprintf(buf, sizeof(buf), "    Slots claimed:");
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
+
+	seq_printf(f, "  %s: slots %d-%d tx_pos=3D%x recycle=3D%x\n",
+		   label, shared->slot_first, shared->slot_last,
+		   shared->tx_pos, shared->slot_queue_recycle);
+
+	seq_puts(f, "    Slots claimed:\n");

 	for (i =3D shared->slot_first; i <=3D shared->slot_last; i++) {
 		struct vchiq_slot_info slot_info =3D
 						*SLOT_INFO_FROM_INDEX(state, i);
 		if (slot_info.use_count !=3D slot_info.release_count) {
-			len =3D scnprintf(buf, sizeof(buf), "      %d: %d/%d", i, slot_info.us=
e_count,
-					slot_info.release_count);
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
+			seq_printf(f, "      %d: %d/%d\n", i, slot_info.use_count,
+				   slot_info.release_count);
 		}
 	}

 	for (i =3D 1; i < shared->debug[DEBUG_ENTRIES]; i++) {
-		len =3D scnprintf(buf, sizeof(buf), "    DEBUG: %s =3D %d(%x)",
-				debug_names[i], shared->debug[i], shared->debug[i]);
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
+		seq_printf(f, "    DEBUG: %s =3D %d(%x)\n",
+			   debug_names[i], shared->debug[i], shared->debug[i]);
 	}
-	return 0;
 }

-static int
-vchiq_dump_service_state(void *dump_context, struct vchiq_service *servic=
e)
+static void
+vchiq_dump_service_state(struct seq_file *f, struct vchiq_service *servic=
e)
 {
-	char buf[80];
-	int len;
-	int err;
 	unsigned int ref_count;

 	/*Don't include the lock just taken*/
 	ref_count =3D kref_read(&service->ref_count) - 1;
-	len =3D scnprintf(buf, sizeof(buf), "Service %u: %s (ref %u)",
-			service->localport, srvstate_names[service->srvstate],
-			ref_count);
+	seq_printf(f, "Service %u: %s (ref %u)", service->localport,
+		   srvstate_names[service->srvstate], ref_count);

 	if (service->srvstate !=3D VCHIQ_SRVSTATE_FREE) {
 		char remoteport[30];
@@ -3460,15 +3440,10 @@ vchiq_dump_service_state(void *dump_context, struc=
t vchiq_service *service)
 			strscpy(remoteport, "n/a", sizeof(remoteport));
 		}

-		len +=3D scnprintf(buf + len, sizeof(buf) - len,
-				 " '%p4cc' remote %s (msg use %d/%d, slot use %d/%d)",
-				 &fourcc, remoteport,
-				 quota->message_use_count, quota->message_quota,
-				 quota->slot_use_count, quota->slot_quota);
-
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
+		seq_printf(f, " '%p4cc' remote %s (msg use %d/%d, slot use %d/%d)\n",
+			   &fourcc, remoteport,
+			   quota->message_use_count, quota->message_quota,
+			   quota->slot_use_count, quota->slot_quota);

 		tx_pending =3D service->bulk_tx.local_insert -
 			service->bulk_tx.remote_insert;
@@ -3486,130 +3461,79 @@ vchiq_dump_service_state(void *dump_context, stru=
ct vchiq_service *service)
 			rx_size =3D service->bulk_rx.bulks[i].size;
 		}

-		len =3D scnprintf(buf, sizeof(buf),
-				"  Bulk: tx_pending=3D%d (size %d), rx_pending=3D%d (size %d)",
-				tx_pending, tx_size, rx_pending, rx_size);
+		seq_printf(f, "  Bulk: tx_pending=3D%d (size %d), rx_pending=3D%d (size=
 %d)\n",
+			   tx_pending, tx_size, rx_pending, rx_size);

 		if (VCHIQ_ENABLE_STATS) {
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
+			seq_printf(f, "  Ctrl: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, =
rx_bytes=3D%llu\n",
+				   service->stats.ctrl_tx_count,
+				   service->stats.ctrl_tx_bytes,
+				   service->stats.ctrl_rx_count,
+				   service->stats.ctrl_rx_bytes);

-			len =3D scnprintf(buf, sizeof(buf),
-					"  Ctrl: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, rx_bytes=3D%=
llu",
-					service->stats.ctrl_tx_count, service->stats.ctrl_tx_bytes,
-					service->stats.ctrl_rx_count, service->stats.ctrl_rx_bytes);
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
+			seq_printf(f, "  Bulk: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, =
rx_bytes=3D%llu\n",
+				   service->stats.bulk_tx_count,
+				   service->stats.bulk_tx_bytes,
+				   service->stats.bulk_rx_count,
+				   service->stats.bulk_rx_bytes);

-			len =3D scnprintf(buf, sizeof(buf),
-					"  Bulk: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, rx_bytes=3D%=
llu",
-					service->stats.bulk_tx_count, service->stats.bulk_tx_bytes,
-					service->stats.bulk_rx_count, service->stats.bulk_rx_bytes);
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
-
-			len =3D scnprintf(buf, sizeof(buf),
-					"  %d quota stalls, %d slot stalls, %d bulk stalls, %d aborted, %d e=
rrors",
-					service->stats.quota_stalls, service->stats.slot_stalls,
-					service->stats.bulk_stalls,
-					service->stats.bulk_aborted_count,
-					service->stats.error_count);
+			seq_printf(f, "  %d quota stalls, %d slot stalls, %d bulk stalls, %d a=
borted, %d errors\n",
+				   service->stats.quota_stalls,
+				   service->stats.slot_stalls,
+				   service->stats.bulk_stalls,
+				   service->stats.bulk_aborted_count,
+				   service->stats.error_count);
 		}
 	}

-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	if (service->srvstate !=3D VCHIQ_SRVSTATE_FREE)
-		err =3D vchiq_dump_platform_service_state(dump_context, service);
-	return err;
+	vchiq_dump_platform_service_state(f, service);
 }

-int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
+void vchiq_dump_state(struct seq_file *f, struct vchiq_state *state)
 {
-	char buf[80];
-	int len;
 	int i;
-	int err;
-
-	len =3D scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
-			conn_state_names[state->conn_state]);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	len =3D scnprintf(buf, sizeof(buf), "  tx_pos=3D%x(@%pK), rx_pos=3D%x(@%=
pK)",
-			state->local->tx_pos,
-			state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
-			state->rx_pos,
-			state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	len =3D scnprintf(buf, sizeof(buf), "  Version: %d (min %d)",
-			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
+
+	seq_printf(f, "State %d: %s\n", state->id,
+		   conn_state_names[state->conn_state]);
+
+	seq_printf(f, "  tx_pos=3D%x(@%pK), rx_pos=3D%x(@%pK)\n",
+		   state->local->tx_pos,
+		   state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
+		   state->rx_pos,
+		   state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
+
+	seq_printf(f, "  Version: %d (min %d)\n", VCHIQ_VERSION,
+		   VCHIQ_VERSION_MIN);

 	if (VCHIQ_ENABLE_STATS) {
-		len =3D scnprintf(buf, sizeof(buf),
-				"  Stats: ctrl_tx_count=3D%d, ctrl_rx_count=3D%d, error_count=3D%d",
-				state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
-				state->stats.error_count);
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
-	}
-
-	len =3D scnprintf(buf, sizeof(buf),
-			"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
-			((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
-			state->local_tx_pos) / VCHIQ_SLOT_SIZE,
-			state->data_quota - state->data_use_count,
-			state->local->slot_queue_recycle - state->slot_queue_available,
-			state->stats.slot_stalls, state->stats.data_stalls);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_platform_state(dump_context);
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_shared_state(dump_context,
-				      state,
-				      state->local,
-				      "Local");
-	if (err)
-		return err;
-	err =3D vchiq_dump_shared_state(dump_context,
-				      state,
-				      state->remote,
-				      "Remote");
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_platform_instances(dump_context);
-	if (err)
-		return err;
+		seq_printf(f, "  Stats: ctrl_tx_count=3D%d, ctrl_rx_count=3D%d, error_c=
ount=3D%d\n",
+			   state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
+			   state->stats.error_count);
+	}
+
+	seq_printf(f, "  Slots: %d available (%d data), %d recyclable, %d stalls=
 (%d data)\n",
+		   ((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
+		   state->local_tx_pos) / VCHIQ_SLOT_SIZE,
+		   state->data_quota - state->data_use_count,
+		   state->local->slot_queue_recycle - state->slot_queue_available,
+		   state->stats.slot_stalls, state->stats.data_stalls);
+
+	vchiq_dump_platform_state(f);
+
+	vchiq_dump_shared_state(f, state, state->local, "Local");
+
+	vchiq_dump_shared_state(f, state, state->remote, "Remote");
+
+	vchiq_dump_platform_instances(f);

 	for (i =3D 0; i < state->unused_service; i++) {
 		struct vchiq_service *service =3D find_service_by_port(state, i);

 		if (service) {
-			err =3D vchiq_dump_service_state(dump_context, service);
+			vchiq_dump_service_state(f, service);
 			vchiq_service_put(service);
-			if (err)
-				return err;
 		}
 	}
-	return 0;
 }

 int vchiq_send_remote_use(struct vchiq_state *state)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index ea8d58844775..564b5c707267 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -6,6 +6,7 @@

 #include <linux/mutex.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/kthread.h>
 #include <linux/kref.h>
@@ -504,8 +505,8 @@ vchiq_bulk_transfer(struct vchiq_instance *instance, u=
nsigned int handle, void *
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mod=
e mode,
 		    enum vchiq_bulk_dir dir);

-extern int
-vchiq_dump_state(void *dump_context, struct vchiq_state *state);
+extern void
+vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);

 extern void
 vchiq_loud_error_header(void);
@@ -561,13 +562,11 @@ void vchiq_complete_bulk(struct vchiq_instance *inst=
ance, struct vchiq_bulk *bul

 void remote_event_signal(struct remote_event *event);

-int vchiq_dump(void *dump_context, const char *str, int len);
-
-int vchiq_dump_platform_state(void *dump_context);
+void vchiq_dump_platform_state(struct seq_file *f);

-int vchiq_dump_platform_instances(void *dump_context);
+void vchiq_dump_platform_instances(struct seq_file *f);

-int vchiq_dump_platform_service_state(void *dump_context, struct vchiq_se=
rvice *service);
+void vchiq_dump_platform_service_state(struct seq_file *f, struct vchiq_s=
ervice *service);

 int vchiq_use_service_internal(struct vchiq_service *service);

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debug=
fs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index 58db78a9c8d4..d833e4e2973a 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -40,6 +40,13 @@ static int debugfs_trace_show(struct seq_file *f, void =
*offset)
 	return 0;
 }

+static int vchiq_dump_show(struct seq_file *f, void *offset)
+{
+	vchiq_dump_state(f, &g_state);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(vchiq_dump);
+
 static int debugfs_trace_open(struct inode *inode, struct file *file)
 {
 	return single_open(file, debugfs_trace_show, inode->i_private);
@@ -115,6 +122,9 @@ void vchiq_debugfs_init(void)
 {
 	vchiq_dbg_dir =3D debugfs_create_dir("vchiq", NULL);
 	vchiq_dbg_clients =3D debugfs_create_dir("clients", vchiq_dbg_dir);
+
+	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, NULL,
+			    &vchiq_dump_fops);
 }

 /* remove all the debugfs entries */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 0bc93f48c14c..307a2d76cbb7 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1306,26 +1306,6 @@ static int vchiq_release(struct inode *inode, struc=
t file *file)
 	return ret;
 }

-static ssize_t
-vchiq_read(struct file *file, char __user *buf, size_t count, loff_t *ppo=
s)
-{
-	struct dump_context context;
-	int err;
-
-	context.buf =3D buf;
-	context.actual =3D 0;
-	context.space =3D count;
-	context.offset =3D *ppos;
-
-	err =3D vchiq_dump_state(&context, &g_state);
-	if (err)
-		return err;
-
-	*ppos +=3D context.actual;
-
-	return context.actual;
-}
-
 static const struct file_operations
 vchiq_fops =3D {
 	.owner =3D THIS_MODULE,
@@ -1335,7 +1315,6 @@ vchiq_fops =3D {
 #endif
 	.open =3D vchiq_open,
 	.release =3D vchiq_release,
-	.read =3D vchiq_read
 };

 static struct miscdevice vchiq_miscdev =3D {
=2D-
2.34.1

