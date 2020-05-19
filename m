Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7833F1D9DF7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 19:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgESRgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 13:36:11 -0400
Received: from mout.gmx.net ([212.227.17.21]:44431 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729001AbgESRgL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 13:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1589909694;
        bh=DgbBuBEeKKy1VO87kSEW0EfBt/LUFOXV9iYEYjJW4vA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=EP+82QhNJACUlQvurDeOJTMEwaPWg+3xbfgIBLZ3/mdGTOuGjGT7oJAk9qQuNHuuO
         SOUyYBkIbIBUXbQRDK+asRCbGaDHI+mSzmIfA+CSAf9SiO8tUJ1bO5MA9qMt0PV/hB
         a8inNDO23VnAr+Ldzola26chTigT6zDTv2hkeq+c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.229.196]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MHXFx-1joael00sT-00DYwM; Tue, 19 May 2020 19:34:54 +0200
From:   Oscar Carter <oscar.carter@gmx.com>
To:     Kees Cook <keescook@chromium.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
        "Lev R . Oshvang ." <levonshe@gmail.com>
Subject: [PATCH v2] firewire: Remove function callback casts
Date:   Tue, 19 May 2020 19:34:25 +0200
Message-Id: <20200519173425.4724-1-oscar.carter@gmx.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JERmYwVR/+/X41rnFajkmiC9+7JlbZf76Grrn9CSDh2nu36nSrt
 QsYyRBaK8uHHcyvNDxMnmApVIJ8rQLCx0jmwBpBNk3u/IEwjZ4DejN0Il9GsxPU+7oRX63I
 LGZVMXiKfG+Vly80USax8iHCxaZ6mOz1ARWvdlYYldbsBqbthmSdHBjK2UPnCHkCg5YX85B
 Mj+Tx+041242IvqNHFwPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1bE5D8caT6A=:KuncZfHcp0wPHvJPAREd1+
 eS5TwfOzwtbWlraCGyAQbvu5S+8ab8J0PJfdXHgId3dWreEoyAyCrwRJ889cx4Sjz9uC4NpcK
 dKqOcG+Ncy0E9sdnnF8W9F7Mn1bFvIuiGFTmaNS0uzHbzqgzPBGnPdMCkhOvIWABwOj4PyJ2n
 QdUt7whypGsZPVFUY9TjsgIaR5wYJO9ZpI+v/J/A06CshyTSBMZUxJD6BeCBUHZfBYXtG1bCs
 EGDW5upNRdYLz+JsR6CjbfVNtSuIm+ATzZ19NS5Z2M6rMFfn/JLgiZ+Jd2enb5qneu1sC95mC
 LSGrI72VpRIFAya1j6WL/2P+Vvw+1CzWAV6iLcyvcR6+r37jWVN1Pu0KaY6Vz2/abr9oC9HAY
 CO/8s4PByS8w47V+7ImpAcUi0xW+rDQUwU67kPTftlqirffH1TCiKnSdx/cgW8hajQWO8/bRY
 W3KiAzBF4cvd6QXxVEMkJYxessY/8RgcvrPNa4ALwWm4cnCJ9k9byWpYEfajV0KIYJIvGHude
 OT2mY1hrNboOBk6TiFDW1NTXRf912WMIZ+F702JAedMPeA/RqDMvT5XF36f8gcNZ/eJE0IshW
 URsY/I27dOUmFyBOP+FwY9D1t/vD9ZYH+8AeOdDksAI+Jc18Z0cXejhCi9I6AiWr+GT4dPP2m
 fEsKnSgTCk16NvhTwxFMiX32DtpOZPlKTc3FfNuPqvVWTxQaLg6cEEjKdDgeinMnfhFWkztpl
 s5ng/jhG7p3AaDpSjYBn8D/8Otxl8K99x9oQjdVkTm0rzrHJ8HyUT6BfDywNYrWWaQ8AGTzwM
 oWrgNpsIW2zV+mBKpwAXdtk1ZXlCEHpDH29CC3X3nfcB37NaHfrKtUpOBVJoJgi+YKwgNZL/F
 bia+PF1ZZ7kSWv/YLRjHg96l4AnPIeivv4Bhobf5WpD5+lRHpC5pE4c8kbze6wx2pqUn/X7Ib
 ydqxMiHiNDawDfMdrmjv8jmTzdifJl/nuxEWTo4DIp+FgTW1gwZ0Xa6stbkEJpcxXVnpD61ZL
 P4wNiUL6OeoQMFold+5gvKhtNK1w8q5fzO27sonijkVqXpG6pMK0wPOZxsWyCJhtkHNmYXZfd
 uJa02I0zg6C9NpavS1sWdT5rllsguA5+xyghmUsnv3knOgROvSkAIcs1tK2oslIGv7JD8hfHR
 pth7ndb1TdYuYLFnZTKNnJdHu2EfDZmQi9vRVjYXn9Z/zzKJ0mwxqbh5p1hOy1VURihi4gPvY
 B9ntdw3zY1aZYwy/3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In an effort to enable -Wcast-function-type in the top-level Makefile to
support Control Flow Integrity builds, remove all the function callback
casts.

To do this, modify the "fw_iso_context_create" function prototype adding
a new parameter for the multichannel callback. Also, fix all the
function calls accordingly.

In the "fw_iso_context_create" function return an error code if both
callback parameters are NULL and also set the "ctx->callback.sc"
explicity to NULL in this case. It is not necessary set to NULL the
"ctx->callback.mc" variable because this and "ctx->callback.sc" are an
union and setting one implies setting the other one to the same value.

Signed-off-by: Oscar Carter <oscar.carter@gmx.com>
=2D--
Changelog v1->v2
-Set explicity to NULL the "ctx->callback.sc" variable and return an error
 code in "fw_iso_context_create" function if both callback parameters are
 NULL as Lev R. Oshvang suggested.
-Modify the commit changelog accordingly.

 drivers/firewire/core-cdev.c        | 12 +++++++-----
 drivers/firewire/core-iso.c         | 14 ++++++++++++--
 drivers/firewire/net.c              |  2 +-
 drivers/media/firewire/firedtv-fw.c |  3 ++-
 include/linux/firewire.h            |  3 ++-
 sound/firewire/amdtp-stream.c       |  2 +-
 sound/firewire/isight.c             |  4 ++--
 7 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 6e291d8f3a27..cc368b35be2e 100644
=2D-- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -957,7 +957,8 @@ static int ioctl_create_iso_context(struct client *cli=
ent, union ioctl_arg *arg)
 {
 	struct fw_cdev_create_iso_context *a =3D &arg->create_iso_context;
 	struct fw_iso_context *context;
-	fw_iso_callback_t cb;
+	fw_iso_callback_t cb_sc =3D NULL;
+	fw_iso_mc_callback_t cb_mc =3D NULL;
 	int ret;

 	BUILD_BUG_ON(FW_CDEV_ISO_CONTEXT_TRANSMIT !=3D FW_ISO_CONTEXT_TRANSMIT |=
|
@@ -970,7 +971,7 @@ static int ioctl_create_iso_context(struct client *cli=
ent, union ioctl_arg *arg)
 		if (a->speed > SCODE_3200 || a->channel > 63)
 			return -EINVAL;

-		cb =3D iso_callback;
+		cb_sc =3D iso_callback;
 		break;

 	case FW_ISO_CONTEXT_RECEIVE:
@@ -978,11 +979,11 @@ static int ioctl_create_iso_context(struct client *c=
lient, union ioctl_arg *arg)
 		    a->channel > 63)
 			return -EINVAL;

-		cb =3D iso_callback;
+		cb_sc =3D iso_callback;
 		break;

 	case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
-		cb =3D (fw_iso_callback_t)iso_mc_callback;
+		cb_mc =3D iso_mc_callback;
 		break;

 	default:
@@ -990,7 +991,8 @@ static int ioctl_create_iso_context(struct client *cli=
ent, union ioctl_arg *arg)
 	}

 	context =3D fw_iso_context_create(client->device->card, a->type,
-			a->channel, a->speed, a->header_size, cb, client);
+			a->channel, a->speed, a->header_size, cb_sc, cb_mc,
+			client);
 	if (IS_ERR(context))
 		return PTR_ERR(context);
 	if (client->version < FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW)
diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index 185b0b78b3d6..1d28a98c08b2 100644
=2D-- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -131,7 +131,8 @@ size_t fw_iso_buffer_lookup(struct fw_iso_buffer *buff=
er, dma_addr_t completed)

 struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 		int type, int channel, int speed, size_t header_size,
-		fw_iso_callback_t callback, void *callback_data)
+		fw_iso_callback_t cb_sc, fw_iso_mc_callback_t cb_mc,
+		void *callback_data)
 {
 	struct fw_iso_context *ctx;

@@ -145,7 +146,16 @@ struct fw_iso_context *fw_iso_context_create(struct f=
w_card *card,
 	ctx->channel =3D channel;
 	ctx->speed =3D speed;
 	ctx->header_size =3D header_size;
-	ctx->callback.sc =3D callback;
+
+	if (cb_sc) {
+		ctx->callback.sc =3D cb_sc;
+	} else if (cb_mc) {
+		ctx->callback.mc =3D cb_mc;
+	} else {
+		ctx->callback.sc =3D NULL;
+		return ERR_PTR(-EINVAL);
+	}
+
 	ctx->callback_data =3D callback_data;

 	return ctx;
diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 715e491dfbc3..c5cc0a311aa0 100644
=2D-- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1136,7 +1136,7 @@ static int fwnet_broadcast_start(struct fwnet_device=
 *dev)
 	context =3D fw_iso_context_create(dev->card, FW_ISO_CONTEXT_RECEIVE,
 					IEEE1394_BROADCAST_CHANNEL,
 					dev->card->link_speed, 8,
-					fwnet_receive_broadcast, dev);
+					fwnet_receive_broadcast, NULL, dev);
 	if (IS_ERR(context)) {
 		retval =3D PTR_ERR(context);
 		goto failed;
diff --git a/drivers/media/firewire/firedtv-fw.c b/drivers/media/firewire/=
firedtv-fw.c
index 97144734eb05..d2940adefd8c 100644
=2D-- a/drivers/media/firewire/firedtv-fw.c
+++ b/drivers/media/firewire/firedtv-fw.c
@@ -141,7 +141,8 @@ int fdtv_start_iso(struct firedtv *fdtv)

 	ctx->context =3D fw_iso_context_create(device->card,
 			FW_ISO_CONTEXT_RECEIVE, fdtv->isochannel,
-			device->max_speed, ISO_HEADER_SIZE, handle_iso, fdtv);
+			device->max_speed, ISO_HEADER_SIZE,
+			handle_iso, NULL, fdtv);
 	if (IS_ERR(ctx->context)) {
 		err =3D PTR_ERR(ctx->context);
 		goto fail_free;
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index aec8f30ab200..3a0b5e18e140 100644
=2D-- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -452,7 +452,8 @@ struct fw_iso_context {

 struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 		int type, int channel, int speed, size_t header_size,
-		fw_iso_callback_t callback, void *callback_data);
+		fw_iso_callback_t cb_sc, fw_iso_mc_callback_t cb_mc,
+		void *callback_data);
 int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels=
);
 int fw_iso_context_queue(struct fw_iso_context *ctx,
 			 struct fw_iso_packet *packet,
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 37d38efb4c87..8629ab3e2c64 100644
=2D-- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1093,7 +1093,7 @@ static int amdtp_stream_start(struct amdtp_stream *s=
, int channel, int speed,

 	s->context =3D fw_iso_context_create(fw_parent_device(s->unit)->card,
 					  type, channel, speed, ctx_header_size,
-					  ctx_cb, ctx_data);
+					  ctx_cb, NULL, ctx_data);
 	if (IS_ERR(s->context)) {
 		err =3D PTR_ERR(s->context);
 		if (err =3D=3D -EBUSY)
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 6655af53b367..51cc37fca736 100644
=2D-- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -361,8 +361,8 @@ static int isight_start_streaming(struct isight *isigh=
t)
 	isight->context =3D fw_iso_context_create(isight->device->card,
 						FW_ISO_CONTEXT_RECEIVE,
 						isight->resources.channel,
-						isight->device->max_speed,
-						4, isight_packet, isight);
+						isight->device->max_speed, 4,
+						isight_packet, NULL, isight);
 	if (IS_ERR(isight->context)) {
 		err =3D PTR_ERR(isight->context);
 		isight->context =3D NULL;
=2D-
2.20.1

