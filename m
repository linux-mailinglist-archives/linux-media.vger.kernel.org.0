Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6DF7AC5EE
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 01:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjIWXx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 19:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIWXx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 19:53:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6EA124
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 16:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695513210; x=1696118010; i=wahrenst@gmx.net;
 bh=Tg3/Rgq6bBAwir3Q4gTvfCUODTuGBf6h3528te7E2x4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=IAdW5mB/9rr2EnhD9TwSaMmMow/1iVKsgzAVSxuCEvqxX9Yw8dHRNjZa8IrN/m3a8SmjqNgZSYf
 rPFRF5CZdBNfAsaXv8E0thclnT0zFG//dyHcl2ACVK6z3j+3etcvtMxMCmzRUwI/izPOMlu2RWVfY
 AUG6GyvRInehelfKEaMKbFu1JBnwjGc/INEFmyG5dprIqdbt34MC0iRxoipvKrEyxtonwWvrt9AGY
 DnldiUW3vLS7oWMN1cxLDbxlz0T/HSF2HSEHBkvoCqU08Qk5WUUZLvoXp8t11/OuF7MEaOrTqlG0K
 d4DDASc3VUdliCjH64KGob00at6JO/vD07Ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1rnO2517zP-01503E; Sun, 24
 Sep 2023 01:53:30 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <error27@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC] staging: vchiq_arm: move state dump to debugfs
Date:   Sun, 24 Sep 2023 01:53:25 +0200
Message-Id: <20230923235325.14329-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TJqGwsWJkm97Mq8r5aRtxf+lN6PjvoRW6pKonuIMUmQp4gy9X2V
 B6Dd4LmP0WOHe5i89h49NsNijAoGwDJBXDod8ijw78EtEiLtbTLAEUrA/U3sr552vlOmRtj
 rxgTIVUCkgmbgN9VfcEFtuRB4Lsyl93KsdnoGBSNfw2KF50fC9qjw9IsTNY3O6Y1Vj5UVcB
 Q3yg5VpudZkLfDH4fMKzw==
UI-OutboundReport: notjunk:1;M01:P0:LgJf3bl5URk=;Bb2qNRb5/3KhMFc6fmQVPlqLI2j
 YtIa9l0aSrw/mnIVK6ko/0M9qRJLIsNWS4zIn6YLuUMomCyy+br/eP362PqOLCxxoxc6csHXB
 NphcKsU7+ukQDxIbRRXNp8u7CF+LRBP86a5zmt5zbBO/q4CwuWa0KdvnRzZurxml9hXdvf2hM
 QlqrjSZE0apqsHlsBY3olx3L40ejKE+2mdXXk/1Wrz9UxhfndfxhZCXDfk6gcPORl29OFlnOd
 ar0rcU8tLtaW7PN3oXjAt9K0LZ6CFDi1Yi2X1ErHS2BLwqPrCOnY9/XUr7yeawveZcfYdY4Ti
 eF/K9PKW0B10QbwQItJ0SI6ibL/flA1ORfGCVJT7B+aL5H/XcvlugDFDkdhD+KZG6rUOlnjHL
 XYUZgq2o67yysmOrRMdMFU2pASTox4tqEOEpspYMeU3+3NxnIIrUqMrBPQq5wdgeVGKHnXp+O
 H9/q4s+m079aOdp4hb5shxo9pkh6AjUfV4o6bcpmciSbBMwKRDOHV/mBJ57yVZZG5Vl8nG0pJ
 /70uSe/bg+ZMuMvT+PcJTXGTC6fc9p3R8KWsrw5DJFnLNsp+U/pSneD/h297iKsOSYpWw3IJq
 7PXrvBQ0iQKp/ytQ9dW8MeIcLebCeIMCXoiFXfTxwhUQHADmpD0uKz9uRCMjHz33Tm3Kumkgr
 5yR5p78/W2xEm2iaNkO6uV/e/0Rfc9tk1PbXbOLC5e5yNBV+MY/tf4UHnyg5sZ73SkcrLqUv2
 1NgmGlp+purkGirN8oMpRV2Z8/MEnyZ+M1/PVuHq22BO4ZVuitX6j+mLxYy53V0zfQJSS0e1S
 HgtTFwP/OocSUK9d3pmQTjr5qdO8T+WBOtNAC3Hu0zNh8N1n08KpJ8OzCek3ZZF8NowYRN5h/
 0wtupV1VWwkFaUnAGvMIQaf00Ax3Ke9bp1P4JUoW0eqyVyhCXCPHntfymWpo3n4NhE+61Igxq
 QFpXDyYVvsPMRPDLFWnrl49nz1M=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Hello,

since recent discussion raised the question about the future of debugfs
for vchiq [1], i want to submit this cleanup patch as part of the
discussion. The patch itself based on the latest series [2] of
Umang Jain to convert VCHIQ into a bus. I'm aware of the checkpatch
warnings which will be fixed in the next version, but not revelant
to the discussion.

Best regards

[1] - https://lore.kernel.org/lkml/7ea529c2-3da6-47df-9b09-28d4ab36c4ef@ka=
dam.mountain/T/
[2] - https://lore.kernel.org/linux-arm-kernel/dc6d4108-7bb0-ba81-2f6b-040=
9b848ab0d@ideasonboard.com/T/#t

 .../interface/vchiq_arm/vchiq_arm.c           |  94 ++-----
 .../interface/vchiq_arm/vchiq_arm.h           |   7 -
 .../interface/vchiq_arm/vchiq_core.c          | 236 ++++++------------
 .../interface/vchiq_arm/vchiq_core.h          |  17 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |  10 +
 .../interface/vchiq_arm/vchiq_dev.c           |  21 --
 6 files changed, 116 insertions(+), 269 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 5eccf5b277e5..150b85ce29da 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -662,13 +662,9 @@ vchiq_complete_bulk(struct vchiq_instance *instance, =
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
@@ -1177,56 +1173,13 @@ service_callback(struct vchiq_instance *instance, =
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
@@ -1251,7 +1204,6 @@ int vchiq_dump_platform_instances(void *dump_context=
)
 	for (i =3D 0; i < state->unused_service; i++) {
 		struct vchiq_service *service;
 		struct vchiq_instance *instance;
-		int err;

 		rcu_read_lock();
 		service =3D rcu_dereference(state->services[i]);
@@ -1267,43 +1219,35 @@ int vchiq_dump_platform_instances(void *dump_conte=
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
index 2fb31f9b527f..372f4d06ffbb 100644
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
 extern int vchiq_arm_log_level;
 extern int vchiq_susp_log_level;

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 596894338cb4..fa234d460401 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3394,8 +3394,8 @@ vchiq_set_service_option(struct vchiq_instance *inst=
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
@@ -3412,139 +3412,83 @@ vchiq_dump_shared_state(void *dump_context, struc=
t vchiq_state *state,
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

-int vchiq_dump_service_state(void *dump_context, struct vchiq_service *se=
rvice)
+void vchiq_dump_service_state(struct seq_file *f, struct vchiq_service *s=
ervice)
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
@@ -3564,15 +3508,10 @@ int vchiq_dump_service_state(void *dump_context, s=
truct vchiq_service *service)
 			strscpy(remoteport, "n/a", sizeof(remoteport));
 		}

-		len +=3D scnprintf(buf + len, sizeof(buf) - len,
-				 " '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)",
-				 VCHIQ_FOURCC_AS_4CHARS(fourcc), remoteport,
-				 quota->message_use_count, quota->message_quota,
-				 quota->slot_use_count, quota->slot_quota);
-
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
+		seq_printf(f, " '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)\n"=
,
+			   VCHIQ_FOURCC_AS_4CHARS(fourcc), remoteport,
+			   quota->message_use_count, quota->message_quota,
+			   quota->slot_use_count, quota->slot_quota);

 		tx_pending =3D service->bulk_tx.local_insert -
 			service->bulk_tx.remote_insert;
@@ -3580,52 +3519,35 @@ int vchiq_dump_service_state(void *dump_context, s=
truct vchiq_service *service)
 		rx_pending =3D service->bulk_rx.local_insert -
 			service->bulk_rx.remote_insert;

-		len =3D scnprintf(buf, sizeof(buf),
-				"  Bulk: tx_pending=3D%d (size %d), rx_pending=3D%d (size %d)",
-				tx_pending,
-				tx_pending ?
-				service->bulk_tx.bulks[BULK_INDEX(service->bulk_tx.remove)].size :
-				0, rx_pending, rx_pending ?
-				service->bulk_rx.bulks[BULK_INDEX(service->bulk_rx.remove)].size :
-				0);
+		seq_printf(f, "  Bulk: tx_pending=3D%d (size %d), rx_pending=3D%d (size=
 %d)\n",
+			   tx_pending,
+			   tx_pending ? service->bulk_tx.bulks[BULK_INDEX(service->bulk_tx.rem=
ove)].size : 0,
+			   rx_pending,
+			   rx_pending ? service->bulk_rx.bulks[BULK_INDEX(service->bulk_rx.rem=
ove)].size : 0);

 		if (VCHIQ_ENABLE_STATS) {
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
-
-			len =3D scnprintf(buf, sizeof(buf),
-					"  Ctrl: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, rx_bytes=3D%=
llu",
-					service->stats.ctrl_tx_count, service->stats.ctrl_tx_bytes,
-					service->stats.ctrl_rx_count, service->stats.ctrl_rx_bytes);
-			err =3D vchiq_dump(dump_context, buf, len + 1);
-			if (err)
-				return err;
-
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
-		}
-	}
-
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	if (service->srvstate !=3D VCHIQ_SRVSTATE_FREE)
-		err =3D vchiq_dump_platform_service_state(dump_context, service);
-	return err;
+			seq_printf(f, "  Ctrl: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, =
rx_bytes=3D%llu\n",
+				   service->stats.ctrl_tx_count,
+				   service->stats.ctrl_tx_bytes,
+				   service->stats.ctrl_rx_count,
+				   service->stats.ctrl_rx_bytes);
+
+			seq_printf(f, "  Bulk: tx_count=3D%d, tx_bytes=3D%llu, rx_count=3D%d, =
rx_bytes=3D%llu\n",
+				   service->stats.bulk_tx_count,
+				   service->stats.bulk_tx_bytes,
+				   service->stats.bulk_rx_count,
+				   service->stats.bulk_rx_bytes);
+
+			seq_printf(f, "  %d quota stalls, %d slot stalls, %d bulk stalls, %d a=
borted, %d errors\n",
+				   service->stats.quota_stalls,
+				   service->stats.slot_stalls,
+				   service->stats.bulk_stalls,
+				   service->stats.bulk_aborted_count,
+				   service->stats.error_count);
+		}
+	}
+
+	vchiq_dump_platform_service_state(f, service);
 }

 void
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index ec1a3caefaea..8568e37f89e0 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -6,6 +6,7 @@

 #include <linux/mutex.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/kthread.h>
 #include <linux/kref.h>
 #include <linux/rcupdate.h>
@@ -508,11 +509,11 @@ vchiq_bulk_transfer(struct vchiq_instance *instance,=
 unsigned int handle, void *
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mod=
e mode,
 		    enum vchiq_bulk_dir dir);

-extern int
-vchiq_dump_state(void *dump_context, struct vchiq_state *state);
+extern void
+vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);

-extern int
-vchiq_dump_service_state(void *dump_context, struct vchiq_service *servic=
e);
+extern void
+vchiq_dump_service_state(struct seq_file *f, struct vchiq_service *servic=
e);

 extern void
 vchiq_loud_error_header(void);
@@ -568,13 +569,11 @@ void vchiq_complete_bulk(struct vchiq_instance *inst=
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
index dc667afd1f8c..0333da728011 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -36,6 +36,13 @@ static struct vchiq_debugfs_log_entry vchiq_debugfs_log=
_entries[] =3D {
 	{ "arm",  &vchiq_arm_log_level },
 };

+static int vchiq_dump_show(struct seq_file *f, void *offset)
+{
+	vchiq_dump_state(f, &g_state);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(vchiq_dump);
+
 static int debugfs_log_show(struct seq_file *f, void *offset)
 {
 	int *levp =3D f->private;
@@ -211,6 +218,9 @@ void vchiq_debugfs_init(void)
 	vchiq_dbg_dir =3D debugfs_create_dir("vchiq", NULL);
 	vchiq_dbg_clients =3D debugfs_create_dir("clients", vchiq_dbg_dir);

+	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, NULL,
+			    &vchiq_dump_fops);
+
 	/* create an entry under <debugfs>/vchiq/log for each log category */
 	dir =3D debugfs_create_dir("log", vchiq_dbg_dir);

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 841e1a535642..ec043e8e60c7 100644
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

